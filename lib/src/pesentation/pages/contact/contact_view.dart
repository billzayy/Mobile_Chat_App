import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/contact/contact_ctrl.dart';
import 'package:software_project_3/config/theme_material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/room_chat_view.dart';

class ContactView extends GetView<ContactController> {
  static const String routerName = '/ContactView';
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        title: 'Contacts',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Danh sach ban be'),
          Expanded(
            child: Obx(
              () {
                if (controller.isLoading.isTrue) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: controller.userContact.length,
                      itemBuilder: (context, index) {
                        final item = controller.userContact[index];
                        return Column(
                          children: <Widget>[
                            ContactList(
                              charInput: "A",
                              numInput: 1,
                            ),
                            ContactList(
                              charInput: "B",
                              numInput: 2,
                            ),
                            ContactList(
                              charInput: "C",
                              numInput: 4,
                            ),
                          ],,
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class CardContact extends StatelessWidget {
  const CardContact({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RoomChatView.routerName),
      child: Card(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'user name',
                    style: Get.theme.textTheme.titleMedium,
                  ),
                  Text(
                    'Status',
                    style: Get.theme.textTheme.titleSmall,
                  )
                ],
              )
            ],
          )),
    );
  }
}

class CardList extends StatelessWidget {
  final int numInput;
  const CardList({super.key, required this.numInput});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: numInput,
            itemBuilder: (context, index) {
              return const CardContact();
            })
      ],
    );
   }
}

class ContactList extends StatelessWidget {
  final String charInput;
  final int numInput;
  const ContactList(
      {super.key, required this.charInput, required this.numInput});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(charInput,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        CardList(numInput: numInput),
      ],
