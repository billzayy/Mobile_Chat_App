import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/config/localVariable.dart';
import 'package:software_project_3/config/theme_material.dart';
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
                    () => Text(controller.fullName.value
                    ),
                  ),

                ],
              ),
              Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.account_circle_outlined,
                                    color: Color(0xff5C33CF),
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                               Text(
                                  'Account',

                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.notifications_none,
                                    color: Color(0xff5C33CF),
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Notifications',

                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios)

                            ],
                          ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.security_sharp,
                                  color: Color(0xff5C33CF),
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Security and Privacy',

                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.storage_outlined,
                                    color: Color(0xff5C33CF),
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Storage',

                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.chat_outlined,
                                    color: Color(0xff5C33CF),
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Chat',

                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.device_hub,
                                  color: Color(0xff5C33CF),
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Devices',

                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.help_center_outlined,
                                    color: Color(0xff5C33CF),
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Help',

                                  ),
                                ],
                              ),
                            ],
                          ),

                      ),
                    ),
                  ],
                ),
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
        ),
      ),
    );
  }
}
