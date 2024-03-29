import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class ContactController extends GetxController {
  final RxList<UserModel> userContact = <UserModel>[].obs;
  final RxList<UserModel> userSearch = <UserModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isSearch = false.obs;
  final UserService _userService = Get.find();
  final TextEditingController searchTinTucController = TextEditingController();
  int userId = 0;
  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(LocalVariable.userId)!;
    fetch();
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

  Future search({required String keySearch, bool refresh = false}) async {
    final ApiResponse<List<UserModel>> res =
        await _userService.search(keySearch);
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
