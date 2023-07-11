import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/domain/model/message_model.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/room_chat_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/widgets/left_content.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/widgets/right_content.dart';
import 'package:software_project_3/src/pesentation/pages/update_group/update_group_view.dart';

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
            leadingWidth: 20,
            title: Obx(() {
              return Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.15,
                    height: Get.width * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: ExtendedImage.network(
                          controller.member.value?.pictures ?? '',
                          fit: BoxFit.cover,
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    controller.member.value?.fullname ?? '',
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ],
              );
            }),
            actions: [
              IconButton(
                onPressed: () => Get.toNamed(UpdateGroupView.routerName),

                icon: Icon(
                  Icons.more_vert,
                  size: 26,
                  color: Colors.deepPurple[500],
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

            Expanded(child: Obx(
              () {
                if (controller.idGroup != null) {
                  if (controller.isLoading.isTrue) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      reverse: true,
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        final reversedList = List.from(controller.messages.reversed);
                        final message = reversedList[index];
                        MessageModel? lastItem;
                        if (index > 0) {
                          lastItem = controller.messages[index - 1];
                        }
                        MessageModel? currentItem = message;

                        MessageModel? nextItem;
                        if ((controller.messages.length - 1) > index) {
                          nextItem = controller.messages[index + 1];
                        }

                        if (currentItem?.sendby != controller.userId) {
                          return LeftContent(
                            current: currentItem!,
                            last: lastItem,
                            next: nextItem,
                          );
                        }
                        return RightContent(
                          current: currentItem!,
                          last: lastItem,
                          next: nextItem,
                          currentIndex: index,
                        );
                      },
                    );
                  }
                }
                return Center(
                  child: Container(
                    width: 300,
                    height: 240,
                    decoration: BoxDecoration(color: Colors.deepPurple.withOpacity(0.3), borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Chúng ta chưa có tin nhắn nào ở đây...",
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "bắt đầu gửi tin nhắn ngay nào!",
                            style: Get.theme.textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: 200,
                            child: ExtendedImage.network(
                              'https://cdn.dribbble.com/userupload/3271927/file/original-223856aa8fef836d7bc818da6154f3ab.gif',
                              fit: BoxFit.cover,
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    reverse: true,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final reversedList =
                          List.from(controller.messages.reversed);
                      final message = reversedList[index];
                      MessageModel? lastItem;
                      if (index > 0) {
                        lastItem = controller.messages[index - 1];
                      }
                      MessageModel? currentItem = message;

                      MessageModel? nextItem;
                      if ((controller.messages.length - 1) > index) {
                        nextItem = controller.messages[index + 1];
                      }

                      if (currentItem?.sendby != controller.userId) {
                        return LeftContent(
                          current: currentItem!,
                          last: lastItem,
                          next: nextItem,
                        );
                      }
                      return RightContent(
                        current: currentItem!,
                        last: lastItem,
                        next: nextItem,
                        currentIndex: index,
                      );
                    },
                  );
                },
              ),
            ),
            const GetBottomBar()
          ],
        ),
      ),
    );
  }
}

class GetBottomBar extends GetView<RoomChatController> {
  const GetBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

                GestureDetector(onTap: () => controller.getCameraImages(), child: Image.asset(IconAssets.iconCamera)),

                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: controller.messageEditController,

                    decoration: const InputDecoration(hintText: 'Message', border: InputBorder.none),

                  ),
                ),
                IconButton(
                  onPressed: () => controller.sendMessage(),

                  icon: const Icon(
                    Icons.send,
                    color: Colors.deepPurple,
                  ),
                ),
                GestureDetector(onTap: () => controller.getGallery(), child: Image.asset(IconAssets.iconGallery)),

              ],
            ),
          ),
        ))
      ],
    );
  }
}
