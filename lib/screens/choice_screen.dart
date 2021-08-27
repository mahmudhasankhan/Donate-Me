import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:get/get.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: kPrimaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
            height: size.height,
            width: double.infinity,
            decoration: backgroundImage,
          ),
          Positioned(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height:200,),
                  Text("Choose A Category",
                  style: categoryFont,),
                  SizedBox(height: 100,),
                  ElevatedButton(onPressed: () => Get.toNamed('/choice-screen-two') ,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 5.0,
                    shadowColor: Colors.black
                  ), 
                  child: Text("Be A Donor", 
                  style: buttonFontSansita,)
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
          
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 5.0,
                    shadowColor: Colors.black
                  ), 
                  child: Text("Need Help?", 
                  style: buttonFontSansita)
                  )
                ],
              ),
          ),] 
        ) 
        );
  }
}
