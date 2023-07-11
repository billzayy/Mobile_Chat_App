import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localVariable.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_view.dart';
import 'package:software_project_3/src/pesentation/pages/root_app.dart';

class AppStartView extends StatefulWidget {
  static const String routeName = '/';

  const AppStartView({Key? key}) : super(key: key);

  @override
  State<AppStartView> createState() => _AppStartViewState();
}

class _AppStartViewState extends State<AppStartView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final prefs = await SharedPreferences.getInstance();
        bool isLogin = prefs.getBool(LocalVariable.isLogin) ?? false;
        if (isLogin) {
          print(isLogin);
          Get.offAllNamed(RootApp.routerName);
          return;
        }
        Get.offAllNamed(LoginView.routeName);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
      ),
    );
  }
}
