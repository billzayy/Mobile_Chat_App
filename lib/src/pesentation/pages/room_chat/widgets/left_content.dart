import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/domain/model/message_model.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/room_chat_ctrl.dart';

import '../../../../../config/assets.dart';

class LeftContent extends StatelessWidget {
  final MessageModel? last;
  final MessageModel current;
  final MessageModel? next;
  final bool isHienThiGio;

  const LeftContent({
    Key? key,
    required this.current,
    required this.last,
    required this.next,
    this.isHienThiGio = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = RoomChatController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                controller.member.value?.fullname ?? '',
                style: Get.theme.textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    current.messages ?? '',
                    style: const TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
