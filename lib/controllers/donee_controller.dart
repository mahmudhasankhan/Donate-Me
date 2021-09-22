import 'package:donate_me/constants/firebase.dart';
import 'package:donate_me/models/donee.dart';
import 'package:get/get.dart';

class DoneeController extends GetxController {
  static DoneeController instance = Get.find();

  RxList<DoneeModel> donee = RxList<DoneeModel>([]);

  String collection = 'donees';

  @override
  void onReady() {
    super.onReady();
    donee.bindStream(getAllDonees());
  }

  Stream<List<DoneeModel>> getAllDonees() =>
      firebaseFirestore.collection(collection).snapshots().map(
          (query) => query.docs.map((item) => DoneeModel.fromMap(item.data())).toList());
}
