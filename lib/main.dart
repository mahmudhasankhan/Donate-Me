import 'package:donate_me/controllers/app_controller.dart';
import 'package:donate_me/controllers/auth_controller.dart';
import 'package:donate_me/controllers/donee_controller.dart';
import 'package:donate_me/controllers/nav_controller.dart';
import 'package:donate_me/screens/auth/reg_donee_screen.dart';
import 'package:donate_me/screens/auth/reg_org_screen.dart';
import 'package:donate_me/screens/auth/sign_in_screen.dart';
import 'package:donate_me/screens/choice_screen.dart';
import 'package:donate_me/screens/choice_screen_two.dart';
import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/screens/auth/reg_donor_screen.dart';
import 'package:donate_me/screens/home/home.dart';
import 'package:donate_me/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialization.then((value) {
    Get.put(AuthController());
    Get.put(AppController());
    Get.put(NavController());
    Get.put(DoneeController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DonateMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: kPrimaryColor,
          // elevation: 0,
        ),
        primaryColor: kPrimaryColor,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ChoiceScreen()),
        GetPage(name: '/choice-screen-two', page: () => ChoiceScreenTwo()),
        GetPage(name: '/sign-up-screen', page: () => RegDonorScreen()),
        GetPage(name: '/sign-in-screen', page: () => SignInScreen()),
        GetPage(name: '/home-screen', page: () => HomeScreen()),
        GetPage(name: '/org-signup-screen', page: () => RegOrgScreen()),
        GetPage(name: '/main-screen', page: () => MainScreen()),
        GetPage(name: '/reg-donee-screen', page: () => RegDoneeScreen()),
      ],
    );
  }
}
