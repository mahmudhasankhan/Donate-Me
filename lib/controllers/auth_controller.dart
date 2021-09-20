

import 'package:donate_me/helpers/show_loading.dart';
import 'package:donate_me/models/donee.dart';
import 'package:donate_me/models/donor.dart';
import 'package:donate_me/models/org.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/firebase.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> orgsigninFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> orgsignupFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> doneeSigninFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> doneeSignupFormKey = GlobalKey<FormState>();

  String donorsCollection = 'donors';
  String orgsCollection = 'organizations';
  String doneeCollection = 'donees';

  Rx<DonorModel> donorModel = DonorModel().obs;
  Rx<OrgModel> orgModel = OrgModel().obs;
  Rx<DoneeModel> doneeModel = DoneeModel().obs;

  late Rx<User?> firebaseUser;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController needs = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/');
    } else {
      donorModel.bindStream(listenToDonor());
      doneeModel.bindStream(listenToDonee());
      orgModel.bindStream(listenToOrg());
      Get.offAllNamed('/main-screen');
    }
  }

  Stream<DonorModel> listenToDonor() => firebaseFirestore
      .collection(donorsCollection)
      .doc(firebaseUser.value?.uid)
      .snapshots()
      .map((snapshot) => DonorModel.fromSnapshot(snapshot));

  Stream<DoneeModel> listenToDonee() => firebaseFirestore
      .collection(doneeCollection)
      .doc(firebaseUser.value?.uid)
      .snapshots()
      .map((snapshot) => DoneeModel.fromSnapshot(snapshot));

  Stream<OrgModel> listenToOrg() => firebaseFirestore
      .collection(orgsCollection)
      .doc(firebaseUser.value?.uid)
      .snapshots()
      .map((snapshot) => OrgModel.fromSnapshot(snapshot));

  void doneeSignIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        // String _userId = result.user!.uid;
        // _initializeDoneeModel(_userId);
        _clearSignInControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign In Failed', 'Try again');
    }
  }

  void orgSignIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        // String _userId = result.user!.uid;
        // _initializeOrgModel(_userId);
        _clearSignInControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign In Failed', 'Try again');
    }
  }

  void donorSignIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        // String _userId = result.user!.uid;
        // _initializeDonorModel(_userId);
        _clearSignInControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign In Failed', 'Try again');
    }
  }

  void doneeSignUp() async {
    try {
      showLoading();
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addDoneeToFirestore(_userId);
        // _initializeDoneeModel(_userId);
        _clearSignUpControllers();
        result.user?.updateDisplayName(doneeModel.value.name);
        result.user?.updateEmail(doneeModel.value.email);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign Up Failed', 'Try again');
    }
  }

  void orgSignUp() async {
    try {
      showLoading();
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addOrgToFirestore(_userId);
        // _initializeOrgModel(_userId);
        _clearSignUpControllers();
        result.user?.updateDisplayName(orgModel.value.name);
        result.user?.updateEmail(orgModel.value.email);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign Up Failed', 'Try again');
    }
  }

  void donorSignUp() async {
    try {
      showLoading();
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addDonorToFirestore(_userId);
        // _initializeDonorModel(_userId);
        _clearSignUpControllers();
        result.user?.updateDisplayName(donorModel.value.name);
        result.user?.updateEmail(donorModel.value.email);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign Up Failed', 'Try again');
    }
  }

  void signOut() {
    auth.signOut();
  }

  _addDoneeToFirestore(String userId) {
    firebaseFirestore.collection(doneeCollection).doc(userId).set({
      'id': userId,
      'name': name.text.trim(),
      'address': address.text.trim(),
      'phone': phone.text.trim(),
      'email': email.text.trim(),
      'password': password.text.trim(),
      'needs': needs.text.trim()
    });
  }

  _addOrgToFirestore(String userId) {
    firebaseFirestore.collection(orgsCollection).doc(userId).set({
      'id': userId,
      'name': name.text.trim(),
      'address': address.text.trim(),
      'phone': phone.text.trim(),
      'email': email.text.trim(),
      'password': password.text.trim()
    });
  }

  _addDonorToFirestore(String userId) {
    firebaseFirestore.collection(donorsCollection).doc(userId).set({
      'id': userId,
      'name': name.text.trim(),
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

  _initializeOrgModel(String userId) async {
    orgModel.value = await firebaseFirestore
        .collection(donorsCollection)
        .doc(userId)
        .get()
        .then((doc) => OrgModel.fromSnapshot(doc));
  }

  _initializeDoneeModel(String userId) async {
    doneeModel.value = await firebaseFirestore
        .collection(doneeCollection)
        .doc(userId)
        .get()
        .then((doc) => DoneeModel.fromSnapshot(doc));
  }

  _clearSignUpControllers() {
    name.clear();
    email.clear();
    address.clear();
    password.clear();
    phone.clear();
  }

  _clearSignInControllers() {
    email.clear();
    password.clear();
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

  String? validateProblem(String val) {
    if (val.length < 10) {
      return 'Must be above 10 characters';
    }
    return null;
  }
}
