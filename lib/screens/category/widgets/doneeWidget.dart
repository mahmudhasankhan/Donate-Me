import 'package:donate_me/controllers/donee_controller.dart';
import 'package:donate_me/models/donee.dart';
import 'package:donate_me/screens/category/widgets/single_donee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoneeWidget extends GetWidget<DoneeController> {
   const DoneeWidget({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .52,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 7.0,
        crossAxisSpacing: 10.0,
        children:controller.donee.map((DoneeModel donee) {
          return SingleDoneeWidget(donee: donee);
        }).toList());
  }
}
