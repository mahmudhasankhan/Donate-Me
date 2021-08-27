import 'package:donate_me/controllers/app_controller.dart';
import 'package:donate_me/controllers/auth_controller.dart';
import 'package:donate_me/screens/auth/sign_in_screen.dart';
import 'package:donate_me/screens/choice_screen.dart';
import 'package:donate_me/screens/choice_screen_two.dart';
import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/screens/auth/reg_donor_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialization.then((value) {
    Get.put(AuthController());
    Get.put(AppController());
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
        GetPage(name: '/sign-in-screen', page: ()=> SignInScreen()),
      ],
    );
  }
}
