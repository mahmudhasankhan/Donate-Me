import 'package:donate_me/constants/constants.dart';
import 'package:donate_me/constants/controllers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegDoneeScreen extends StatelessWidget {
  const RegDoneeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/empty_screen.png',
        width: double.infinity,
        height: size.height,
        fit: BoxFit.cover,),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Spacer(
                  flex: 2,
                ),
                Text(
                  "Sign Up As A Donee!",
                  style: categoryFont,
                  textAlign: TextAlign.center,
                ),
                Spacer(
                  flex: 2,
                ),
                Container(
                  height: size.height * 0.65,
                  width: size.width - 30,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding - 10,
                          vertical: kDefaultPadding),
                      child: SingleChildScrollView(
                        child: Form(
                              key: authController.doneeSignupFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: authController.name,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelText: 'Name',
                                        hintText: 'Enter your name',
                                        prefixIcon: Icon(
                                            Icons.account_circle_outlined)),
                                    keyboardType: TextInputType.name,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: authController.address,
                                    validator: (value) =>
                                        authController.validateAddress(value!),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelText: 'Address',
                                        hintText: 'Enter your address',
                                        prefixIcon: Icon(
                                            Icons.add_location_alt_outlined)),
                                    keyboardType: TextInputType.streetAddress,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: authController.phone,
                                    validator: (value) =>
                                        authController.validatePhone(value!),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelText: 'Phone',
                                        hintText: 'Enter your phone number',
                                        prefixIcon: Icon(Icons.call)),
                                    keyboardType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: authController.email,
                                    validator: (value) =>
                                        authController.validateEmail(value!),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelText: 'Email',
                                        hintText: 'Enter your email',
                                        prefixIcon: Icon(Icons.email)),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: authController.password,
                                    validator: (value) =>
                                        authController.validatePassword(value!),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelText: 'Password',
                                        hintText: 'Enter your password',
                                        prefixIcon: Icon(Icons.password)),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    controller: authController.needs,
                                    validator: (value) => authController.validateProblem(value!),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      labelText: 'Needs',
                                      hintText: 'State your needs',
                                      prefixIcon: Icon(Icons.report_problem)
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                        width: size.width),
                                    child: ElevatedButton(
                                      child: Text(
                                        'Register',
                                        style: buttonFontSansita,
                                      ),
                                      onPressed: () {
                                        if (authController
                                            .doneeSignupFormKey.currentState!
                                            .validate()) {
                                          authController.doneeSignUp();
                                        }
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kPrimaryColor)),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                Spacer(),
                RichText(
                    text: TextSpan(
                        style: GoogleFonts.sansita(
                            textStyle: TextStyle(fontSize: 17)),
                        children: [
                      TextSpan(text: 'Already have an account? '),
                      TextSpan(
                          text: 'Sign in',
                          style: TextStyle(color: Colors.blue, fontSize: 19),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed('/sign-in-screen', arguments: 'donee'))
                    ])),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}