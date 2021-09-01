import 'package:get/get.dart';

class NavController extends GetxController {
  static NavController instance = Get.find();
  var _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set setselectedIndex(index) => this._selectedIndex.value = index;
}
