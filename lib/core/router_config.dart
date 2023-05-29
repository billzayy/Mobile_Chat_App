import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/app_start.dart';
import 'package:software_project_3/src/pesentation/login/login_ctrl.dart';
import 'package:software_project_3/src/pesentation/login/login_view.dart';
import 'package:software_project_3/src/pesentation/sign/sign_ctrl.dart';
import 'package:software_project_3/src/pesentation/sign/sign_view.dart';

class RouterConfigs {
  static final List<GetPage> routes = [
    GetPage(
      name: AppStartView.routeName,
      page: () => const AppStartView(),
    ),
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => LoginController());
        },
      ),
    ),
    GetPage(
      name: SignView.routeName,
      page: () => const SignView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => SignController());
          // Get.put(DashBoardController());
        },
      ),
    ),
    // ...TinTucRouterConfigs.router
  ];
}
