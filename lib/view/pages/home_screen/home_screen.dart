import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_test/const/app_colors.dart';
import 'package:zartek_test/controller/home_controller.dart';
import 'package:zartek_test/view/pages/home_screen/widgets/menu_item.dart';
import 'package:zartek_test/controller/tab_controller/tab_controller.dart';
import 'widgets/appbar_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final HomeScreenTabs _tabs = Get.put(HomeScreenTabs());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.kLightGrey, size: 30),
        actions: const [
          CartIcon(),
        ],
        backgroundColor: AppColors.kWhite,
        bottom: TabBar(
          isScrollable: true,
          labelColor: AppColors.kRed,
          unselectedLabelColor: AppColors.kLightGrey,
          indicatorColor: AppColors.kRed,
          controller: _tabs.controller,
          tabs: _tabs.tabs,
        ),
      ),
      body: TabBarView(controller: _tabs.controller, children: [
        ListView.separated(
            separatorBuilder: ((context, index) => const Divider(
                  thickness: 1,
                )),
            itemCount: 13,
            itemBuilder: (context, index) {
              return const CustomMenuItem();
            }),
        const Center(child: Text('Tab 2')),
        const Center(child: Text('Tab 3 ')),
        const Center(child: Text('Tab 3')),
        const Center(child: Text('Tab 3')),
        const Center(child: Text('Tab 3')),
      ]),
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
