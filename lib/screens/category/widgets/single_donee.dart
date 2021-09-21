import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/models/donee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleDoneeWidget extends StatelessWidget {
  final DoneeModel donee;

  const SingleDoneeWidget({Key? key, required this.donee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
     Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              width: double.infinity,
              height: size.height * .07,
              color: kPrimaryColor,
              padding: EdgeInsets.all(5),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  donee.name,
                  style: GoogleFonts.roboto(
                      textStyle:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
            child: Text('Address: ' + donee.address,
                style: GoogleFonts.roboto(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
            child: Text('Phone: ' + donee.phone,
                style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ))),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Problem: ' + donee.needs,
                  style: GoogleFonts.roboto(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: ()=> Get.toNamed('/payment-screen'),
              child: Text(
                'Donate',
                style: buttonFontSansita,
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor)))
        ],
      ),
    );
  }
}
