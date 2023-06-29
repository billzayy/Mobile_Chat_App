import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/config/localVariable.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_view.dart';
import 'package:software_project_3/src/pesentation/pages/profile/profile_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/update_user/update_user_view.dart';


import '../help/help_view.dart';
import '../notification/notification_view.dart';
import '../storage/storage_view.dart';

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
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
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
                  Obx(
                    () => Text(controller.fullName.value),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Get.width,
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white54),
                  child: Column(
                    children: [
                      CustomButton(
                        icon: Icon(Icons.account_circle),
                        text: 'Account',
                        onTap: () => Get.toNamed(UpdateUserView.routerName),
                      ),
                      CustomButton(
                        icon: Icon(Icons.notifications),
                        text: 'Notifications',
                        onTap: () => Get.toNamed(NotificationView.routerName),
                      ),
                      // CustomButton(
                      //   icon: Icon(Icons.lock),
                      //   text: 'Security and Privacy',
                      //   onTap: () => Get.toNamed(SecurityandPrivacyView.routerName),
                      // ),
                      CustomButton(
                        icon: Icon(Icons.storage),
                        text: 'Storage',
                        onTap: () => Get.toNamed(StorageView.routerName),
                      ),

                      CustomButton(
                        icon: Icon(Icons.help),
                        text: 'Help',
                        onTap: () => Get.toNamed(HelpView.routerName),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool(LocalVariable.isLogin, false);
                    Get.offAllNamed(LoginView.routeName);
                  },
                  child: Text('Exit'))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final String? text;
  const CustomButton(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text!,
                  style: Get.theme.textTheme.bodyLarge?.copyWith(),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
