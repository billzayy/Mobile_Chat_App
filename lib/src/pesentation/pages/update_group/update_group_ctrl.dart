import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/src/domain/model/group_model.dart';

class UpdateGroupController extends GetxController {
  late GroupModel groupModel;
  // int? userId;
  int userId = 0;
  @override
  void onInit() {
    loadData();
    groupModel = Get.arguments['model'];

    super.onInit();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(LocalVariable.userId)!;
    // fetch();
  }
}
