import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_view.dart';

class SignController extends GetxController {
  final UserService _userService = Get.find();
  final TextEditingController emailEditController =
      TextEditingController(text: 'anh@gmail.com');
  final RxnString emailChiError = RxnString(null);
  final TextEditingController fullNameEditController =
      TextEditingController(text: 'xuan anh');
  final RxnString fullNameError = RxnString(null);
  final TextEditingController phoneEditController =
      TextEditingController(text: '1234567890');
  final RxnString phoneError = RxnString(null);
  final TextEditingController passwordEditController =
      TextEditingController(text: 'Anh@123anh');
  final RxnString passwordError = RxnString(null);
  final NoTiConfig tinTucConfig = Get.find();
  bool isChecked = false;
  final RegExp phoneRegex = RegExp(r'^([1-9])?\d{10}$');
  final RegExp specialCharsRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;
  var isCheck = false.obs;
  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  void toggleCheckbox() {
    isCheck.value = !isCheck.value;
  }

  Future onSend() async {
    /// reset all error
    emailChiError.value = null;
    passwordError.value = null;
    phoneError.value = null;
    fullNameError.value = null;

    /// check valid
    if (emailEditController.text.trim().isEmpty ||
        !emailEditController.text.contains('@')) {
      emailChiError.call('email không đúng định dạng !');
      // tinTucConfig.showSnackBar('Bạn Chưa Nhập email ',
      //     backgroundColor: Colors.amber);
      return;
    }
    if (fullNameEditController.text.trim().isEmpty) {
      fullNameError.call('full name chưa nhập');

      return;
    }
    if (!phoneRegex.hasMatch(phoneEditController.text.trim())) {
      phoneError.call('SDT không hợp lệ!');

      return;
    }

    if (passwordEditController.text.trim().isEmpty ||
        passwordEditController.text.contains(' ') ||
        !specialCharsRegex.hasMatch(passwordEditController.text.trim())) {
      passwordError
          .call('pass 8 ký tự,chữ hoa, kí tự đặc biệt, không có khoảng trống');
      return;
    }
    if (isCheck.value == false) {
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'Vui Lòng chấp nhận các điều khoản',
          backgroundColor: Colors.orangeAccent);
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
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'Đăng Kí Tài Khoản Thành Công <3',
          backgroundColor: Get.theme.colorScheme.primary);
      _cleanInput();
      Get.offAllNamed(LoginView.routeName);
    } else {
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'Tài Khoản đã tồn tại vui lòng thử email khác !',
          backgroundColor: Colors.orangeAccent);
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
