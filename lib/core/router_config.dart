import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/login/login_ctrl.dart';
import 'package:software_project_3/src/pesentation/login/login_view.dart';

class RouterConfigs {
  static final List<GetPage> routes = [
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: BindingsBuilder(
        () {
          Get.put(LoginController());
        },
      ),
    ),
    // GetPage(
    //   name: DashBoardView.routeName,
    //   page: () => const DashBoardView(),
    //   binding: BindingsBuilder(
    //         () {
    //       Get.put(HomeController());
    //       Get.put(DashBoardController());
    //     },
    //   ),
    // ),
    // ...TinTucRouterConfigs.router
  ];
}
