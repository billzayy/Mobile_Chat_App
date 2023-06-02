import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
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
                const Column(
                  children: [
                    Text('user name'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
