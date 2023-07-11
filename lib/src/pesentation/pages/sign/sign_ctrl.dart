import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_view.dart';

class SignController extends GetxController {
  final UserService _userService = Get.find();
  final TextEditingController emailEditController = TextEditingController();
  final RxnString emailChiError = RxnString(null);
  final TextEditingController fullNameEditController = TextEditingController();
  final RxnString fullNameError = RxnString(null);
  final TextEditingController phoneEditController = TextEditingController();
  final RxnString phoneError = RxnString(null);
  final TextEditingController passwordEditController = TextEditingController();
  final RxnString passwordError = RxnString(null);
  final NoTiConfig tinTucConfig = Get.find();
  bool isChecked = false;
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  Future onSend() async {
    /// reset all error
    emailChiError.value = null;
    passwordError.value = null;
    phoneError.value = null;
    fullNameError.value = null;

    /// check valid
    if (emailEditController.text.trim().isEmpty) {
      emailChiError.call('email hoặc password không hợp lệ!');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập email ', backgroundColor: Colors.amber);
      return;
    }
    if (fullNameEditController.text.trim().isEmpty) {
      fullNameError.call('email hoặc password không hợp lệ!');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập email ', backgroundColor: Colors.amber);
      return;
    }
    if (phoneEditController.text.trim().isEmpty) {
      phoneError.call('email hoặc password không hợp lệ !');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập phone number ', backgroundColor: Colors.amber);
      return;
    }
    if (passwordEditController.text.trim().isEmpty) {
      passwordError.call('email hoặc password không hợp lệ !');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập password', backgroundColor: Colors.amber);
      return;
    }

    _signUser();
  }

  Future _signUser() async {
    Map<String, dynamic> param = {
      "password": passwordEditController.text.trim(),
      "email": emailEditController.text.trim(),
      "fullName": fullNameEditController.text.trim(),
      "phone": phoneEditController.text.trim()
    };
    final ApiResponse<String> res = await _userService.signUser(param);
    if (res.status == ApiResponseStatus.completed) {
      tinTucConfig.showSnackBar(title: 'Thông báo', 'Đăng Kí Tài Khoản Thành Công <3', backgroundColor: Get.theme.colorScheme.primary);
      _cleanInput();
      Get.offAllNamed(LoginView.routeName);
    } else {
      // Get.log(res.message.toString());
      tinTucConfig.showSnackBar(title: 'Thông báo', 'Tài Khoản đã tồn tại vui lòng thử email khác !', backgroundColor: Colors.orangeAccent);
    }
    isLoading.call(false);
  }

  void _cleanInput() {
    emailEditController.text = '';
    fullNameEditController.text = '';
    phoneEditController.text = '';
    passwordEditController.text = '';
  }
}
