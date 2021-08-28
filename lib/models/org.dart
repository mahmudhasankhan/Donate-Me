import 'package:cloud_firestore/cloud_firestore.dart';

class OrgModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const ADDRESS = 'address';
  static const EMAIL = 'email';
  static const PASSWORD = 'password';

  late String id;
  late String name;
  late String address;
  late String email;
  late String password;

  OrgModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.password,
  });

  OrgModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot[ID];
    name = snapshot[NAME];
    address = snapshot[ADDRESS];
    email = snapshot[EMAIL];
    password = snapshot[PASSWORD];
  }
}
