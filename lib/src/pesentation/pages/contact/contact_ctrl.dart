import 'package:get/get.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class ContactController extends GetxController {
  final RxList<UserModel> userContact = <UserModel>[].obs;
  final RxBool isLoading = true.obs;
  final UserService _userService = Get.find();

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  Future fetch() async {
    final ApiResponse<List<UserModel>> res = await _userService.getUser();
    if (res.status == ApiResponseStatus.completed) {
      userContact.call(res.data);
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
