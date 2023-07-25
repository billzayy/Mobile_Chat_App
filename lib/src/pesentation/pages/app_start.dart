import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/config/localvariable.dart';
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
      body: ExtendedImage.network(
        'https://cdn.dribbble.com/users/1338391/screenshots/15457107/media/b17248e7459b760da025bd8f7efbfe51.jpg?resize=1000x750&vertical=center',
        fit: BoxFit.cover,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        shape: BoxShape.rectangle,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case LoadState.completed:
              return null;
            case LoadState.failed:
              return Image.asset(
                ImageAssets.defaultUser,
              );
          }
        },
      ),
    );
  }
}
