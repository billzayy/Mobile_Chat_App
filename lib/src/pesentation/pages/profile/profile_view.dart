import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_view.dart';
import 'package:software_project_3/src/pesentation/pages/profile/page_profile/help/help_view.dart';
import 'package:software_project_3/src/pesentation/pages/profile/page_profile/notification/notification_view.dart';
import 'package:software_project_3/src/pesentation/pages/profile/page_profile/storage/storage_view.dart';
import 'package:software_project_3/src/pesentation/pages/profile/page_profile/update_user/update_user_view.dart';
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
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: Get.width,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ExtendedImage.network(
                        'https://cdn.dribbble.com/users/1338391/screenshots/15663110/media/775b1e57702f82e557992e0a13894bd2.jpg?resize=1000x750&vertical=center',
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
                    Positioned(
                      bottom: 0,
                      right: 50,
                      left: 50,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SizedBox(
                              width: Get.width * 0.25,
                              height: Get.width * 0.25,
                              child: ClipOval(
                                child: ExtendedImage.network(
                                  controller.member.value?.pictures ?? '',
                                  fit: BoxFit.cover,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
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
                            () => Text(
                              controller.member.value?.fullname ?? '',
                              style: Get.theme.textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Infomation',
                                style: Get.theme.textTheme.titleLarge,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.email_outlined,
                                        color: Colors.deepPurple,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Email',
                                        style: Get.theme.textTheme.bodyLarge
                                            ?.copyWith(),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.member.value?.email ?? '',
                                      style: Get.theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: Colors.deepPurple,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Phone',
                                      style: Get.theme.textTheme.bodyLarge
                                          ?.copyWith(),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => Text(
                                    controller.member.value?.phones ?? '',
                                    style: Get.theme.textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.deepPurple,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'City',
                                        style: Get.theme.textTheme.bodyLarge
                                            ?.copyWith(),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.member.value?.city ?? '',
                                      style: Get.theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                          height: 20,
                          color: Colors.grey,
                          endIndent: 30,
                          indent: 30),
                      CustomButton(
                        icon: const Icon(
                          Icons.account_circle,
                          color: Colors.deepPurple,
                        ),
                        text: 'Update Account',
                        onTap: () => Get.toNamed(UpdateUserView.routerName),
                      ),
                      CustomButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.deepPurple,
                        ),
                        text: 'Notifications',
                        onTap: () => Get.toNamed(NotificationView.routerName),
                      ),
                      CustomButton(
                        icon: const Icon(
                          Icons.storage,
                          color: Colors.deepPurple,
                        ),
                        text: 'Storage',
                        onTap: () => Get.toNamed(StorageView.routerName),
                      ),
                      CustomButton(
                        icon: const Icon(
                          Icons.help,
                          color: Colors.deepPurple,
                        ),
                        text: 'Help',
                        onTap: () => Get.toNamed(HelpView.routerName),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool(LocalVariable.isLogin, false);
                    Get.offAllNamed(LoginView.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    height: 50,
                    width: 100,
                    child: Center(
                        child: Text(
                      'Log Out',
                      style: Get.theme.textTheme.titleMedium
                          ?.copyWith(color: Colors.white),
                    )),
                  ))
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
