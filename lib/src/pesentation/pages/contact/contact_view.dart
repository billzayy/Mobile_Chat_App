import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/contact/contact_ctrl.dart';
import 'package:extended_image/extended_image.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/room_chat_view.dart';

class ContactView extends GetView<ContactController> {
  static const String routerName = '/ContactView';
  const ContactView({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> alphabet = [
    {'letter': 'A', 'count': 0},
    {'letter': 'B', 'count': 0},
    {'letter': 'C', 'count': 0},
    {'letter': 'D', 'count': 0},
    {'letter': 'E', 'count': 0},
    {'letter': 'F', 'count': 0},
    {'letter': 'G', 'count': 0},
    {'letter': 'H', 'count': 0},
    {'letter': 'I', 'count': 0},
    {'letter': 'J', 'count': 0},
    {'letter': 'K', 'count': 0},
    {'letter': 'L', 'count': 0},
    {'letter': 'M', 'count': 0},
    {'letter': 'N', 'count': 0},
    {'letter': 'O', 'count': 0},
    {'letter': 'P', 'count': 0},
    {'letter': 'Q', 'count': 0},
    {'letter': 'R', 'count': 0},
    {'letter': 'S', 'count': 0},
    {'letter': 'T', 'count': 0},
    {'letter': 'U', 'count': 0},
    {'letter': 'V', 'count': 0},
    {'letter': 'W', 'count': 0},
    {'letter': 'X', 'count': 0},
    {'letter': 'Y', 'count': 0},
    {'letter': 'Z', 'count': 0},
  ];

  int checkLetter(String letter) {
    int number = 0;
    for (int i = 0; i < controller.userContact.length; i++) {
      if (controller.userContact[i].fullname![0] == letter) {
        number = number + 1;
      }
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        title: 'Contacts',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'My Contact',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.isLoading.isTrue) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        // final item = controller.userContact[index];
                        return Column(
                          children: <Widget>[
                            for (int i = 0; i < alphabet.length; i++)
                              if (checkLetter(alphabet[i]['letter']) != 0)
                                ContactList(
                                  charInput: alphabet[i]["letter"],
                                ),
                          ],
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
  final String person;
  final String status;

  const CardContact({super.key, required this.person, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  person,
                  style: Get.theme.textTheme.titleMedium,
                ),
                Text(
                  status,
                  style: Get.theme.textTheme.titleSmall,
                )
              ],
            )
          ],
        ));
  }
}

class CardList extends StatelessWidget {
  final String person;
  final String status;
  const CardList({super.key, required this.person, required this.status});

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
            itemCount: 1,
            itemBuilder: (context, index) {
              return CardContact(person: person, status: status);
            })
      ],
    );
  }
}

class ContactList extends GetView<ContactController> {
  final String? charInput;
  const ContactList({
    super.key,
    required this.charInput,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('$charInput'.toUpperCase(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      for (int i = 0; i < controller.userContact.length; i++)
        if (controller.userContact[i].fullname![0].toUpperCase() == charInput)
          GestureDetector(
              onTap: () => Get.toNamed(RoomChatView.routerName, arguments: {
                    'idGroup': null,
                    'idMember': controller.userContact[i].idUser,
                    'groupName': null,
                  }),
              child: CardList(
                  person: "${controller.userContact[i].fullname}",
                  status: "${controller.userContact[i].status}"))
    ]);
  }
}
