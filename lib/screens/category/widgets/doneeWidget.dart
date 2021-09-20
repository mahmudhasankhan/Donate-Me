import 'package:donate_me/models/donee.dart';
import 'package:donate_me/screens/category/widgets/single_donee.dart';
import 'package:flutter/material.dart';

class DoneeWidget extends StatelessWidget {
   const DoneeWidget({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .57,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 7.0,
        crossAxisSpacing: 10.0,
        children: <DoneeModel>[
          DoneeModel(
              id: '1024536',
              name: 'Sahara Khatun',
              address: 'Khulna Bangladesh',
              email: 'sahara@gmail.com',
              password: 'sahara123',
              needs: 'I am desperate in need of financial assistance',
              phone: '0174589632'),
          DoneeModel(
              id: '1023536',
              name: 'Sakina Khatun',
              address: 'Khulna Bangladesh',
              email: 'sakinaa@gmail.com',
              password: 'sakinara123',
              needs: 'I am desperate in need of financial assistance',
              phone: '01745896122'),
          DoneeModel(
              id: '1024526',
              name: 'Roton Mia',
              address: 'Khulna Bangladesh',
              email: 'Roton@gmail.com',
              password: 'Roton123',
              needs: 'I am desperate in need of financial assistance',
              phone: '0174582332'),
          DoneeModel(
              id: '1024536',
              name: 'Kashem Khan',
              address: 'Khulna Bangladesh',
              email: 'Kashem@gmail.com',
              password: 'kashem123',
              needs: 'I am desperate in need of financial assistance',
              phone: '0174582342'),
          DoneeModel(
              id: '1024536',
              name: 'Marium Bibi',
              address: 'Barishal, Bangladesh',
              email: 'marium@gmail.com',
              password: 'marium123',
              needs: 'I am desperate in need of financial assistance',
              phone: '0174512332'),
          DoneeModel(
              id: '1024536',
              name: 'Jhankar Mahbub',
              address: 'Noakhali, Bangladesh',
              email: 'mahbub@gmail.com',
              password: 'mahbub23',
              needs: 'I am desperate in need of financial assistance',
              phone: '0174589632'),
        ].map((DoneeModel donee) {
          return SingleDoneeWidget(donee: donee);
        }).toList());
  }
}
