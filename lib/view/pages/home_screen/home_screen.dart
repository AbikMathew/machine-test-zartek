import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_test/const/app_colors.dart';
import 'package:zartek_test/controller/home_controller.dart';
import 'package:zartek_test/view/pages/home_screen/widgets/menu_item.dart';
import 'widgets/appbar_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.isDataLoading.value
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.kLightGreen,
                ),
              ),
            )
          : CustomScaffold(homeController: homeController),
    );
  }
}

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.kLightGrey, size: 30),
        actions: const [
          CartIcon(),
        ],
        backgroundColor: AppColors.kWhite,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: TabBar(
            isScrollable: true,
            labelColor: AppColors.kRed,
            unselectedLabelColor: AppColors.kLightGrey,
            indicatorColor: AppColors.kRed,
            controller: homeController.tabController,
            tabs: homeController.tabs,
          ),
        ),
      ),
      body: TabBarView(
        controller: homeController.tabController,
        children: List<Widget>.generate(
          homeController.product![0].tableMenuList!.length,
          (index) => CustomMenuItem(catDishIndex: index),
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
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
