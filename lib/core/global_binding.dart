import 'package:get/get.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/config/tintuc_config_implement.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoTiConfig>(() => NoTiConfigImplement(), fenix: true);
  }
}
