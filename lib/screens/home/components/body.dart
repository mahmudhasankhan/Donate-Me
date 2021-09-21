import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/constants/controllers.dart';
import 'package:donate_me/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding-10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                height: size.height * .25,
                color: kPrimaryColor,
                alignment: Alignment.center,
                child: AnimatedTextKit(animatedTexts: [
                  RotateAnimatedText('Making a step closer to the people in need',
                  textStyle: animatedFontOne,
                  textAlign: TextAlign.center,
                  duration: const Duration(milliseconds: 4000)),
                  RotateAnimatedText('Is a step closer to prosperity', duration: const Duration(milliseconds: 4000),
                  textStyle: animatedFontOne,
                  textAlign: TextAlign.center),
                  RotateAnimatedText('Donate and spread happiness', duration: const Duration(milliseconds: 4000),
                  textStyle: animatedFontOne,
                  textAlign: TextAlign.center), 
                ],
                repeatForever: true,
                pause: const Duration(milliseconds: 1000),),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                Text('Always celebrate charity', 
                style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),),
                SizedBox(width: 5,),
                Icon(Icons.favorite,
                color: Colors.pink,),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ClipRRect(borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: size.height * .25,
              color: kPrimaryColor,
              child: ImageSlideshow(
                indicatorColor: Colors.yellow,
                indicatorBackgroundColor: Colors.grey,
                // autoPlayInterval: 4000,
                initialPage: 0,
                children: [
                  Image.network('https://firebasestorage.googleapis.com/v0/b/donate-me-b4fad.appspot.com/o/jem-sahagun-O33vBPD6hAw-unsplash%20(1).jpg?alt=media&token=f818c0df-214b-46be-a401-56025778d195',
                  fit: BoxFit.cover,),
                  Image.network('https://firebasestorage.googleapis.com/v0/b/donate-me-b4fad.appspot.com/o/joshua-watson-lKYFy_prTFU-unsplash.jpg?alt=media&token=8afb073c-edd8-4bd4-a194-56b4d8efe0e3',
                  fit: BoxFit.cover,),
                  Image.network('https://firebasestorage.googleapis.com/v0/b/donate-me-b4fad.appspot.com/o/loren-joseph-XoBWUBA3Amg-unsplash.jpg?alt=media&token=bad29b29-f69d-4b91-9b12-e4eb8c70dc4f',
                  fit: BoxFit.cover,),
                ],
              ),
            ),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(15),
                         child: Container(
                           height: size.height * .18,
                             width: size.width * 0.4 ,
                             color: kPrimaryColor,
                         ),
                       ),
                      Positioned(
                        left: 10, 
                        right: 10,
                        child: Column(
                          children: [
                            Text('DONATION PROCEDURE ?',
                            textAlign: TextAlign.center, 
                            style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),),
                            SizedBox(height: 10,),
                            ElevatedButton(onPressed: () => Get.toNamed('/steps-screen'), child: Text('CLICK HERE',
                            style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,)), ),
                            style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 5.0,
                    shadowColor: Colors.black,),  
                            )],
                        ))
                     ]
                  ),
                  SizedBox(width: 20,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                      height: size.height * .2,
                      width: size.width * 0.4,
                      ),
                      Positioned(
                        bottom: -5,
                        child: Container(
                          height: size.height * .18,
                          width: size.width *.26,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -2,
                        child: Container(
                            height: size.height * .17,
                            width: size.width *.22,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                          ),
                      ),
                        Positioned(
                          bottom: 30,
                          child: GestureDetector(
                            onTap: (){},
                            child: Column(
                              children: [
                                Text('Top Donors', style:GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,)) ,),
                                Icon(Icons.double_arrow_rounded)
                              ],
                            ),
                          ),
                        ),
                        Positioned(top: 0,
                        left: 57,
                          child: Icon(MyFlutterApp.crown))
                   ],
                    ),
                ],
              ),
            )
        ],
      ),
    ));
  }
}
