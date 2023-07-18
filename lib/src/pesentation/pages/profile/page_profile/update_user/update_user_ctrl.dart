import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/config/refech.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class UpdateUserController extends GetxController {
  final TextEditingController cityEditController =
      TextEditingController(text: 'tphcm');
  final RxnString cityChiError = RxnString(null);
  final TextEditingController fullNameEditController =
      TextEditingController(text: 'Xuân Anh');
  final RxnString fullNameError = RxnString(null);
  final TextEditingController phoneEditController =
      TextEditingController(text: '09876543211');
  final RxnString phoneError = RxnString(null);
  final TextEditingController passwordEditController =
      TextEditingController(text: 'abc');
  final RxnString passwordError = RxnString(null);
  final NoTiConfig tinTucConfig = Get.find();
  final UserService _userService = Get.find();
  final RxBool isLoading = true.obs;
  String email = '';
  int userId = 0;
  RxBool showPassword = false.obs;
  final EventBus eventBus = Get.find();

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  @override
  void onInit() {
    loadData();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString(LocalVariable.email) ?? '';
    userId = prefs.getInt(LocalVariable.userId)!;
  }

  Future onSend() async {
    /// reset all error

    passwordError.value = null;

    /// check valid
    if (passwordEditController.text.trim().isEmpty) {
      passwordError.call(' Password không đúng vui lòng thử lại');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập password ',
          backgroundColor: Colors.amber);
      return;
    }

    _updateUser();
  }

  Future _updateUser() async {
    Map<String, dynamic> param = {
      "Id_User": userId,
      "Password": passwordEditController.text.trim(),
      "Email": email,
      "FullName": fullNameEditController.text.trim(),
      "Phone": phoneEditController.text.trim(),
      "Pictures": null,
      "City": cityEditController.text.trim(),
      "Status": "online"
    };
    final ApiResponse<String> res = await _userService.updateUser(param);
    if (res.status == ApiResponseStatus.completed) {
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'Update Tài Khoản Thành Công <3',
          backgroundColor: Get.theme.colorScheme.primary);
      _cleanInput();
      eventBus.fire(RefechUser());
    } else {
      // Get.log(res.message.toString());
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'update thất bại vui lòng thử lại !',
          backgroundColor: Colors.orangeAccent);
    }
    isLoading.call(false);
  }

  void _cleanInput() {
    cityEditController.text = '';
    fullNameEditController.text = '';
    phoneEditController.text = '';
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
