import 'package:donate_me/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ChoiceScreenTwo extends StatelessWidget {
  const ChoiceScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            decoration: backgroundImage,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 2,),
                  Text(quote1, style: GoogleFonts.nunitoSans(textStyle: quoteStyleItalic), textAlign: TextAlign.center,),
                  Text('-Dr. Loretta Scott', style: GoogleFonts.nunitoSans(textStyle: quoteStyle ), textAlign: TextAlign.center,),
                  Spacer(),
                  ElevatedButton(onPressed: ()=>Get.toNamed('/sign-up-screen'), child: Text("Individual Donor?", style: buttonFontSansita,),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 5.0,
                    shadowColor: Colors.black
                  )),
                  Spacer(),
                  Text("Or", style: buttonFontSansita,),
                  Spacer(),
                  ElevatedButton(onPressed: ()=>null, child: Text("Organisation?", style: buttonFontSansita,),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 5.0,
                    shadowColor: Colors.black
                  )),
                  Spacer(),
                  Text(quote2, style: GoogleFonts.nunitoSans(textStyle: quoteStyleItalic), textAlign: TextAlign.center,),
                  Text('-Arabian Proverb', style: GoogleFonts.nunitoSans(textStyle: quoteStyle ), textAlign: TextAlign.center,),
                  Spacer(flex: 2,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
