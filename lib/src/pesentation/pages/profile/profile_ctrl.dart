import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/config/refech.dart';
import 'package:software_project_3/config/refech_api.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class ProFileController extends GetxController {
  final UserService _userService = Get.find();
  int userId = 0;
  final Rxn<UserModel> member = Rxn<UserModel>();
  final RxBool isLoading = true.obs;
  EventBus eventBus = Get.find();
  StreamSubscription? streamSubscription;
  @override
  void onInit() {
    loadData();
    // TODO: implement onInit
    listenEventReload();
    super.onInit();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(LocalVariable.userId)!;
    fetchUser();
  }

  Future fetchUser() async {
    final ApiResponse<UserModel> res = await _userService.getUserId(userId);
    if (res.status == ApiResponseStatus.completed) {
      member.call(res.data);
    } else {
      Get.log(res.message.toString());
    }
    isLoading.call(false);
  }

  void listenEventReload() {
    streamSubscription = eventBus.on<RefechUser>().listen((event) {
      fetchUser();
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
