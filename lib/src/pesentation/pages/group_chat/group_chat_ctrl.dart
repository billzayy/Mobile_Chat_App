import 'package:get/get.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class GroupChatController extends GetxController {
  final RxList<UserModel> listUser = <UserModel>[].obs;
  final RxBool isLoading = true.obs;
  final UserService _userService = Get.find();
  final RxList<UserModel> listUserDaChon = <UserModel>[].obs;
  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  Future fetch() async {
    final ApiResponse<List<UserModel>> res = await _userService.getUser();
    if (res.status == ApiResponseStatus.completed) {
      listUser.call(res.data);
    } else {
      Get.log(res.message.toString());
    }
    isLoading.call(false);
  }

  void selectListUser(UserModel value) {
    if (!listUserDaChon.contains(value)) {
      listUserDaChon.add(value);
    } else {
      listUserDaChon.remove(value);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
