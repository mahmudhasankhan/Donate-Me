import 'package:donate_me/constants/controllers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You are now in homescreen :D'),

          ElevatedButton(onPressed: ()=> authController.signOut(), child: Text('Sign Out'))
        ],
      )),
    );
  }
}