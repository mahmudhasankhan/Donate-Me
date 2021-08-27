import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  String? validateEmail(String val) {
    if (!GetUtils.isEmail(val)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? validatePass(String val) {
    if (val.length < 6) {
      return 'Password must be of 6 characters';
    }
    return null;
  }

  void check(){
  final isValid = loginFormKey.currentState!.validate();
  }
}
