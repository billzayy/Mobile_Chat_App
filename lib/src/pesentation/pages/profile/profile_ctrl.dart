import 'package:get/get.dart';
// import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';

class ProFileController extends GetxController {
  RxString fullName = ''.obs;
  RxString email = ''.obs;

  // RxString fullName = ''.obs;
  // final _isarDatabase = Get.find<IsarDatabase>();
  // final loginController = Get.find<LoginController>();

  @override
  void onInit() {
    loadData();
    // TODO: implement onInit

    super.onInit();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    fullName.value = prefs.getString(LocalVariable.userName) ?? '';
    email.value = prefs.getString(LocalVariable.password) ?? '';
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
