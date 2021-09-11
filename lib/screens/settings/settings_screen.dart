import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/constants/controllers.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(child:  ElevatedButton(
              onPressed: () {
                authController.signOut();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              ),
              child: Text('Sign Out'))),
    );
  }
}