import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/constants.dart';
import 'package:donate_me/constants/controllers.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // body: Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     Container(
      //       height: size.height,
      //       width: double.infinity,
      //       decoration: backgroundImage,
      //     ),
      //     SafeArea(
      //         child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //       child: Column(
      //         children: [
      //           Spacer(
      //             flex: 2,
      //           ),
      //           Text(
      //             "Log in !",
      //             style: categoryFont,
      //           ),
      //           Spacer(
      //             flex: 2,
      //           ),
      //           Container(
      //             height: size.height * 0.5,
      //             width: size.width - 30,
      //             child: Card(
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(20)),
      //               child: Padding(
      //                 padding: EdgeInsets.symmetric(
      //                     horizontal: kDefaultPadding - 10,
      //                     vertical: kDefaultPadding),
      //                 child: SingleChildScrollView(
      //                   child: Form(
      //                     key: authController.loginFormKey,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         TextFormField(
      //                           controller: authController.email,
      //                           validator: (value)=> authController.validateEmail(value!),
      //                           decoration: InputDecoration(
      //                               border: OutlineInputBorder(
      //                                   borderRadius:
      //                                       BorderRadius.circular(10)),
      //                               labelText: 'Email',
      //                               hintText: 'Enter your email',
      //                               prefixIcon: Icon(Icons.email)),
      //                           keyboardType: TextInputType.emailAddress,
      //                         ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         TextFormField(
      //                           controller: authController.password,
      //                           validator: (value)=>authController.validatePassword(value!),
      //                           decoration: InputDecoration(
      //                               border: OutlineInputBorder(
      //                                   borderRadius:
      //                                       BorderRadius.circular(10)),
      //                               labelText: 'Password',
      //                               hintText: 'Enter your password',
      //                               prefixIcon: Icon(Icons.password)),
      //                           keyboardType: TextInputType.visiblePassword,
      //                         ),
      //                         SizedBox(
      //                           height: 30,
      //                         ),
      //                         ConstrainedBox(
      //                           constraints:
      //                               BoxConstraints.tightFor(width: size.width),
      //                           child: ElevatedButton(
      //                             child: Text(
      //                               'Login',
      //                               style: buttonFontSansita,
      //                             ),
      //                             onPressed: () => {},
      //                             style: ButtonStyle(
      //                                 shape: MaterialStateProperty.all(
      //                                     RoundedRectangleBorder(
      //                                         borderRadius:
      //                                             BorderRadius.circular(15))),
      //                                 backgroundColor:
      //                                     MaterialStateProperty.all(
      //                                         kPrimaryColor)),
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Spacer(),
      //           RichText(
      //               text: TextSpan(
      //                   style: GoogleFonts.sansita(
      //                       textStyle: TextStyle(fontSize: 17)),
      //                   children: [
      //                 TextSpan(text: 'Already have an account? '),
      //                 TextSpan(
      //                     text: 'Sign in',
      //                     style: TextStyle(color: Colors.blue, fontSize: 19),
      //                     recognizer: TapGestureRecognizer()
      //                       ..onTap = () => Get.toNamed('/sign-in-screen'))
      //               ])),
      //           Spacer(
      //             flex: 3,
      //           )
      //         ],
      //       ),
      //     ))
      //   ],
      // ),
    );
  }
}