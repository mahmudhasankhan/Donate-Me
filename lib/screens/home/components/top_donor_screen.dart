import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/models/donor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopDonorScreen extends StatelessWidget {
  // const TopDonorScreen({ Key? key }) : super(key: key);

  List<DonorModel> donorlist = [
    DonorModel(
        name: 'Mahmud Hasan',
        address: 'Dhaka, bangladesh',
        id: '001',
        email: 'hasan@gmail.com',
        password: '223154',
        phone: '01243657896'),
    DonorModel(
        name: 'Labiba Islam',
        address: 'Dhaka, bangladesh',
        id: '001',
        email: 'hasan@gmail.com',
        password: '223154',
        phone: '01243657896'),
    DonorModel(
        name: 'Ismat Jahan',
        address: 'Dhaka, bangladesh',
        id: '001',
        email: 'ij@gmail.com',
        password: '223154',
        phone: '01243657896'),
    DonorModel(
        name: 'Nafis Ahmed',
        address: 'Chittagong, bangladesh',
        id: '001',
        email: 'hasan@gmail.com',
        password: '223154',
        phone: '01243657896')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top Donors',style: GoogleFonts.chewy(
              textStyle: TextStyle(fontSize: 28, color: kPrimaryColor),
            ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: kPrimaryColor),),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(backgroundColor: kPrimaryColor,
              child: Text(donorlist[index].name[0]),foregroundColor: Colors.white,),
              title: Text(donorlist[index].name),
              subtitle: Text(donorlist[index].address),

            ),
          );
        },
        itemCount: donorlist.length,
      ),
    );
  }
}
