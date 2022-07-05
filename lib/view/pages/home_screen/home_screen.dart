import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_test/const/app_colors.dart';
import 'package:zartek_test/controller/home_controller.dart';
import 'package:zartek_test/view/pages/home_screen/widgets/menu_item.dart';
import 'package:zartek_test/controller/tab_controller/tab_controller.dart';
import 'package:zartek_test/view/widgets/text_widgets.dart';
import '../../../model/fail.dart';
import 'widgets/appbar_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();
  final HomeScreenTabs controller = Get.put(HomeScreenTabs());

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = controller.tabs.isEmpty;
    // log(homeController.productList[0].tableMenuList![0].categoryDishes![0].dishName);
    return Scaffold(
      appBar: AppBar(
        // titleTextStyle: TextStyle(color: Colors.black),
        // title: Obx(()=>SubHeading(text:homeController.productList[0].tableMenuList![0].categoryDishes![0].dishName)),
        iconTheme: const IconThemeData(color: AppColors.kLightGrey, size: 30),
        actions: const [
          CartIcon(),
        ],
        backgroundColor: AppColors.kWhite,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: 
          // Obx(() => 
          TabBar(
                isScrollable: true,
                labelColor: AppColors.kRed,
                unselectedLabelColor: AppColors.kLightGrey,
                indicatorColor: AppColors.kRed,
                controller: controller.controller,
                tabs: isEmpty ? controller.waitingTabs : controller.tabs,
              ),
              // ),
        ),
      ),
      body: FutureBuilder<List<Product>?>(
          future: homeController.getProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return TabBarView(
                  controller: controller.controller,
                  children: List<Widget>.generate(
                    homeController.productList[0].tableMenuList!.length,
                    (index) => CustomMenuItem(catDishIndex: index),
                  ),
                );
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
      drawer: NavigationDrawer(),
    );
  }
  // );
  //  ),
  //);
}

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: [
            buildHeader(context),
            buildDrawerItems(context),
          ],
        ),
      );
  Widget buildHeader(BuildContext context) => DrawerHeader(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(17),
            bottomRight: Radius.circular(17),
          ),
          color: Colors.green,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              controller.user.displayName!,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              controller.user.uid,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      );

  Widget buildDrawerItems(BuildContext context) => Column(
        children: [
          InkWell(
            onTap: () => controller.logout(),
            child: const ListTile(
              title: Text('Log out'),
              leading: Icon(Icons.logout),
            ),
            //
          ),
        ],
      );
}
