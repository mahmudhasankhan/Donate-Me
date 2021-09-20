import 'package:donate_me/screens/category/widgets/DoneeWidget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
 const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: DoneeWidget(),
      )
    );
  }
}
