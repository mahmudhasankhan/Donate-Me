import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/constants/controllers.dart';
import 'package:donate_me/models/org.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  // const ProfileScreen({Key? key}) : super(key: key);

  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/user_profile.png',
            width: double.infinity,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: size.height * .25,
            left: size.width * .2,
            right: size.width * .2,
            child: Container(
              height: size.height * .2,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        offset: Offset(3, 2),
                        blurRadius: 7)
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user?.displayName ?? '',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                 RichText(
                   text: TextSpan(
                     style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), color: Colors.black),
                    children: [
                      TextSpan(text:'Email: '),
                      TextSpan(text: user?.email ?? '')
                    ]
                   ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: size.height *.05,
                    width: size.width * .5,
                    padding: const EdgeInsets.all(8),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child:RichText(
                   text: TextSpan(
                     style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), color: Colors.black),
                    children: [
                      TextSpan(text:'ID: '),
                      TextSpan(text: user?.uid ?? '')
                    ]
                   ),
                  )),
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
