import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/domain/model/mesage.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/room_chat_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/widgets/left_content.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/widgets/right_content.dart';

class RoomChatView extends GetView<RoomChatController> {
  static const String routerName = '/RoomChatView';

  const RoomChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
              onPressed: () => Get.back(),
            ),
            backgroundColor: Get.theme.colorScheme.background,
            leadingWidth: 30,
            title: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.15,
                  height: Get.width * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
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
                Text(
                  'user name',
                  style: Get.theme.textTheme.titleMedium,
                ),
              ],
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    controller.tinTucConfig.showSnackBar(
                        title: 'Thông báo',
                        'Chức năng đang phát triển',
                        backgroundColor: Colors.orangeAccent);
                  },
                  child: Image.asset(IconAssets.iconPhone)),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  size: 26,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messageDataList.length,
                itemBuilder: (context, index) {
                  final message = messageDataList[index];
                  MessageData? lastItem;
                  if (index > 0) lastItem = messageDataList[index - 1];
                  MessageData? currentItem = message;

                  MessageData? nextItem;
                  if ((messageDataList.length - 1) > index) {
                    nextItem = messageDataList[index + 1];
                  }

                  if (message.sendBy != 'id01') {
                    return LeftContent(
                      current: currentItem,
                      last: lastItem,
                      next: nextItem,
                    );
                  }
                  return RightContent(
                    current: currentItem,
                    last: lastItem,
                    next: nextItem,
                    currentIndex: index,
                  );
                },
              ),
            ),
            getBottomBar()
          ],
        ),
      ),
    );
  }
}

Widget getBottomBar() {
  return Row(
    children: [
      Expanded(
          child: Card(
        color: Get.theme.colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IconAssets.iconCamera),
              const SizedBox(
                width: 8,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Message', border: InputBorder.none),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              ),
              Image.asset(IconAssets.iconGallery),
            ],
          ),
        ),
      ))
    ],
  );
}
