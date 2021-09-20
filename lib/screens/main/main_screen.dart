import 'package:animations/animations.dart';
import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/constants/controllers.dart';
import 'package:donate_me/controllers/nav_controller.dart';
import 'package:donate_me/screens/category/category_screen.dart';
import 'package:donate_me/screens/home/home.dart';
import 'package:donate_me/screens/profile/profile_screen.dart';
import 'package:donate_me/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final NavController _navController = Get.find();

  final List<Widget> bodyContents = [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];

  var user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Donate Me",
            style: GoogleFonts.chewy(
              textStyle: TextStyle(fontSize: 28, color: kPrimaryColor),
            )),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user?.displayName ?? ''),
              accountEmail: Text(user?.email ?? '' ),
              decoration: BoxDecoration(color: kPrimaryColor),
            ),
            ListTile(
              onTap: () {
                authController.signOut();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign Out"),
            )
          ],
        ),
      ),
      body: PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
          child:
              Obx(() => bodyContents.elementAt(_navController.selectedIndex))),
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
                BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
              currentIndex: _navController.selectedIndex,
              onTap: (index) => _navController.setselectedIndex = index,
            )),
      ),
    );
  }
}
