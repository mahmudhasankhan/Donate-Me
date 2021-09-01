import 'package:animations/animations.dart';
import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/controllers/nav_controller.dart';
import 'package:donate_me/screens/category/category_screen.dart';
import 'package:donate_me/screens/home/home.dart';
import 'package:donate_me/screens/profile/profile_screen.dart';
import 'package:donate_me/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final NavController _navController = Get.find();

  final List<Widget> bodyContents = [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) => FadeThroughTransition(animation: primaryAnimation, secondaryAnimation: secondaryAnimation, child: child,),
        child: Obx(()=> bodyContents.elementAt(_navController.selectedIndex))) ,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: Obx(() => BottomNavigationBar(
              backgroundColor: kPrimaryColor,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: IconThemeData(color: Colors.white),
              selectedItemColor: Colors.white70,
              unselectedItemColor: Colors.black.withOpacity(0.32),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: 'Category'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
              currentIndex: _navController.selectedIndex,
              onTap: (index)=> _navController.setselectedIndex = index,
            )),
      ),
    );
  }
}
