import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class UpdateUserController extends GetxController {
  final TextEditingController cityEditController =
      TextEditingController(text: 'hcm');
  final RxnString cityChiError = RxnString(null);
  final TextEditingController fullNameEditController =
      TextEditingController(text: 'Xuan Anh Đẹp Trai');
  final RxnString fullNameError = RxnString(null);
  final TextEditingController phoneEditController =
      TextEditingController(text: '248234903');
  final RxnString phoneError = RxnString(null);
  final NoTiConfig tinTucConfig = Get.find();
  final UserService _userService = Get.find();
  final RxBool isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future onSend() async {
    /// reset all error
    cityChiError.value = null;

    phoneError.value = null;
    fullNameError.value = null;

    /// check valid
    if (cityEditController.text.trim().isEmpty) {
      cityChiError.call('email hoặc password không hợp lệ!');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập email ',
          backgroundColor: Colors.amber);
      return;
    }
    if (fullNameEditController.text.trim().isEmpty) {
      fullNameError.call('email hoặc password không hợp lệ!');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập email ',
          backgroundColor: Colors.amber);
      return;
    }
    if (phoneEditController.text.trim().isEmpty) {
      phoneError.call('email hoặc password không hợp lệ !');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập phone number ',
          backgroundColor: Colors.amber);
      return;
    }

    _updateUser();
  }

  Future _updateUser() async {
    Map<String, dynamic> param = {
      "id_user": 2,
      "password": "abc",
      "email": "nguyenxuananh@gmail.com",
      "fullName": fullNameEditController.text.trim(),
      "phone": phoneEditController.text.trim(),
      "picture": null,
      "city": cityEditController.text.trim(),
      "status": "online"
    };
    final ApiResponse<String> res = await _userService.updateUser(param);
    if (res.status == ApiResponseStatus.completed) {
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'Update Tài Khoản Thành Công <3',
          backgroundColor: Get.theme.colorScheme.primary);
      _cleanInput();
      Get.back();
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
