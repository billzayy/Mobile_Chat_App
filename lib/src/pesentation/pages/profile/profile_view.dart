import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/config/localVariable.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_view.dart';
import 'package:software_project_3/src/pesentation/pages/profile/profile_ctrl.dart';

class ProFileView extends GetView<ProFileController> {
  static const String routerName = '/ProFileView';
  const ProFileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        title: 'Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SizedBox(
                    width: Get.width * 0.25,
                    height: Get.width * 0.25,
                    child: ClipOval(
                      child: ExtendedImage.network(
                        '',
                        fit: BoxFit.cover,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                    ),
                  ),
                ),
                Column(
                  children: [
                    Obx(
                      () => Text(
                        controller.fullName.value,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool(LocalVariable.isLogin, false);
                      Get.offAllNamed(LoginView.routeName);
                    },
                    child: Text('thoát'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
