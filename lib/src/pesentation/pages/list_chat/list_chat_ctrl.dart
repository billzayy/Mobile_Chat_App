import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/src/domain/model/group_model.dart';
import 'package:software_project_3/src/domain/service/group_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class ListChatController extends GetxController {
  final RxList<GroupModel> listGroup = <GroupModel>[].obs;
  final RxBool isLoading = true.obs;
  final GroupService _groupService = Get.find();
  int userId = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(LocalVariable.userId)!;
    fetch();
  }

  Future fetch() async {
    final ApiResponse<List<GroupModel>> res = await _groupService.getGroup(userId);
    if (res.status == ApiResponseStatus.completed) {
      listGroup.call(res.data);
    } else {
      Get.log(res.message.toString());
    }
    isLoading.call(false);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
