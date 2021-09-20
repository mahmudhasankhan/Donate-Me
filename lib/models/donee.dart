import 'package:cloud_firestore/cloud_firestore.dart';

class DoneeModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const ADDRESS = 'address';
  static const EMAIL = 'email';
  static const PASSWORD = 'password';
  static const PHONE = 'phone';
  static const NEEDS = 'needs';

  late String id;
  late String name;
  late String address;
  late String email;
  late String password;
  late String phone;
  late String needs;

  DoneeModel(
      {this.id = '',
      this.name = '',
      this.address = '',
      this.email = '',
      this.password = '',
      this.phone = '',
      this.needs = ''});

  DoneeModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot[ID];
    name = snapshot[NAME];
    address = snapshot[ADDRESS];
    email = snapshot[EMAIL];
    password = snapshot[PASSWORD];
    phone = snapshot[PHONE];
    needs = snapshot[NEEDS];
  }

  DoneeModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    name = data[NAME];
    address = data[ADDRESS];
    email = data[EMAIL];
    password = data[PASSWORD];
    phone = data[PHONE];
    needs = data[NEEDS];
  }
}
