import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';
import 'package:software_project_3/src/pesentation/pages/root_app.dart';

class LoginController extends GetxController {
  // final _isarDatabase = Get.find<IsarDatabase>();
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
    if (emailEditController.text.trim().isEmpty ||
        !emailEditController.text.contains('@')) {
      emailChiError.call('email không đúng định dạng !');
      // tinTucConfig.showSnackBar('Bạn Chưa Nhập email ',
      //     backgroundColor: Colors.amber);
      return;
    }
    if (passwordEditController.text.trim().isEmpty ||
        passwordEditController.text.contains(' ')) {
      passwordError.call('Password không được chứa khoảng trống!');
      return false;
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
      await prefs.setString(LocalVariable.email, userLogin.value!.email!);
      await prefs.setString(LocalVariable.password, userLogin.value!.password!);
      await prefs.setInt(LocalVariable.userId, userLogin.value!.idUser!);
      await prefs.setBool(LocalVariable.isLogin, true);
      _cleanInput();
      Get.offAllNamed(RootApp.routerName);
    } else {
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'Email hoặc Password không đúng.Vui Lòng thử Lại !',
          backgroundColor: Colors.orangeAccent);
    }
    isLoading.call(false);
  }

  void _cleanInput() {
    emailEditController.text = '';
    passwordEditController.text = '';
  }
}
