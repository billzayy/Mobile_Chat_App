import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        // bool isLogin = Storage.instance.readBool(Constant.isLoginKey);
        // if (isLogin) {
        //   await AppInit.initModule();
        // }

        Get.offAllNamed(RootApp.routerName);
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
