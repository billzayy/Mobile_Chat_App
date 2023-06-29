import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/list_chat/list_chat_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/room_chat_view.dart';

class ListChatView extends GetView<ListChatController> {
  static const String routerName = '/ListChatView';
  const ListChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        title: 'Chatify',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: Get.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xfff3f3f4)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextFormField(
                  // controller: controller.tenDoanhNghiepEditController,
                  style: context.theme.textTheme.bodyMedium?.copyWith(),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: context.theme.textTheme.bodyMedium,
                      prefixIcon: const Icon(Icons.search_outlined),
                      border: InputBorder.none),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(RoomChatView.routerName),
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.2,
                            height: Get.width * 0.2,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipOval(
                                child: ExtendedImage.network(
                                  '',
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'user name',
                                style: Get.theme.textTheme.titleMedium,
                              ),
                              Text(
                                'New Messages',
                                style: Get.theme.textTheme.titleSmall,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
