import 'dart:developer';

import 'package:donate_me/models/donor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/firebase.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String donorsCollection = 'donors';
  Rx<DonorModel> donorModel = DonorModel().obs;

  late Rx<User?> firebaseUser;

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser!);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll('/');
    } else {
      Get.offAll('/home-screen');
    }
  }

  void donorSignIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _initializeDonorModel(_userId);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign In Failed', 'Try again');
    }
  }

  void donorSignUp() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addDonorToFirestore(_userId);
        _initializeDonorModel(_userId);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign Up Failed', 'Try again');
    }
  }

  void donorSignOut() {
    auth.signOut();
  }

  _addDonorToFirestore(String userId) {
    firebaseFirestore.collection(donorsCollection).doc(userId).set({
      'id': id.text.trim(),
      'name': userId,
      'address': address.text.trim(),
      'phone': phone.text.trim(),
      'email': email.text.trim(),
      'password': password.text.trim()
    });
  }

  _initializeDonorModel(String userId) async {
    donorModel.value = await firebaseFirestore
        .collection(donorsCollection)
        .doc(userId)
        .get()
        .then((doc) => DonorModel.fromSnapshot(doc));
  }

  String? validateEmail(String val) {
    if (!GetUtils.isEmail(val)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? validatePassword(String val) {
    if (val.length < 6) {
      return 'Password must be of 6 characters';
    }
    return null;
  }

  String? validateAddress(String val) {
    if (val.length > 60) {
      return 'Must be under 60 characters';
    }
    return null;
  }

  String? validatePhone(String val) {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // void checkFormValid() {
  //   final isValid = loginFormKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   loginFormKey.currentState!.save();
  // }
}
