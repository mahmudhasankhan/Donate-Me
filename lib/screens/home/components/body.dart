import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/constants/controllers.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * .25,
            color: kPrimaryColor,
          ),
          ElevatedButton(
              onPressed: () {
                authController.signOut();
              },
              child: Text('Sign Out'))
        ],
      ),
    ));
  }
}
