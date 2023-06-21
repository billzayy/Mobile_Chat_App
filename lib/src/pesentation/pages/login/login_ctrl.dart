import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localVariable.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';
import 'package:software_project_3/src/pesentation/pages/root_app.dart';

class LoginController extends GetxController {
  late Isar isar;
  final Rxn<UserModel> userLogin = Rxn<UserModel>();
  final UserService _userService = Get.find();
  final TextEditingController emailEditController =
      TextEditingController(text: 'nguyenxuananh@gmail.com');
  final RxnString emailChiError = RxnString(null);
  final TextEditingController passwordEditController =
      TextEditingController(text: 'abc');
  final RxnString passwordError = RxnString(null);
  final NoTiConfig tinTucConfig = Get.find();
  bool isChecked = false;
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  Future onSend() async {
    /// reset all error
    emailChiError.value = null;
    passwordError.value = null;

    /// check valid
    if (emailEditController.text.trim().isEmpty) {
      emailChiError.call('email hoặc password không đúng !');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập email ',
          backgroundColor: Colors.amber);
      return;
    }
    if (passwordEditController.text.trim().isEmpty) {
      passwordError.call('email hoặc password không đúng !');
      tinTucConfig.showSnackBar('Bạn Chưa Nhập password',
          backgroundColor: Colors.amber);
      return;
    }

    _loginApp();
  }

  Future _loginApp() async {
    final prefs = await SharedPreferences.getInstance();
    final ApiResponse<UserModel> res = await _userService.loginUser(
        emailEditController.text.trim(), passwordEditController.text.trim());
    if (res.status == ApiResponseStatus.completed) {
      userLogin.call(res.data);
      await prefs.setString(LocalVariable.userName, userLogin.value!.fullname!);
      await prefs.setBool(LocalVariable.isLogin, true);
      _cleanInput();
      Get.offAllNamed(RootApp.routerName);
      await isar.userModels.put(res.data!); // insert & update
      await prefs.setBool(LocalVariable.isLogin, true);
      _cleanInput();
      Get.offAllNamed(RootApp.routerName);
    } else {
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'Đăng Nhập Thất Bại.Vui Lòng thử Lại !',
          backgroundColor: Colors.orangeAccent);
    }
    isLoading.call(false);
  }

  void _cleanInput() {
    emailEditController.text = '';
    passwordEditController.text = '';
  }
}
