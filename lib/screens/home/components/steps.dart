import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepSreen extends StatelessWidget {
  const StepSreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/images/steps.png',
          height: size.height,
          width: size.width, 
          fit: BoxFit.cover),
          IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_back))
          ],        ),
      ),
    );
  }
}