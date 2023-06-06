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
    return const Scaffold(
        appBar: CommonAppbar(
          title: 'Contacts',
        ),
        body: ContactList(charInput: "A"));
  }
}

class NameLetter extends StatelessWidget {
  final String charInput;
  const NameLetter({super.key, required this.charInput});

  @override
  Widget build(BuildContext context) {
    return Text(charInput);
  }
}

class ContactContent extends StatelessWidget {
  const ContactContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.toNamed(RoomChatView.routerName),
                child: Card(
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
                )),
              );
            }));
  }
}

class ContactList extends StatelessWidget {
  final String charInput;
  const ContactList({super.key, required this.charInput});

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [NameLetter(charInput: charInput), ContactContent()],
    // );
    return Column(
      children: [NameLetter(charInput: charInput), ContactContent()],
    );
  }
}
