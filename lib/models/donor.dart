import 'package:cloud_firestore/cloud_firestore.dart';

class DonorModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const ADDRESS = 'address';
  static const EMAIL = 'email';
  static const PASSWORD = 'password';
  static const PHONE = 'phone';

  late String id;
  late String name;
  late String address;
  late String email;
  late String password;
  late String phone;

  DonorModel(
      {this.id = '',
      this.name = '',
       this.address= '',
       this.email = '',
       this.password = '',
       this.phone = ''});

  DonorModel.def();

  DonorModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot[ID];
    name = snapshot[NAME];
    address = snapshot[ADDRESS];
    email = snapshot[EMAIL];
    password = snapshot[PASSWORD];
    phone = snapshot[PHONE];
  }
}
