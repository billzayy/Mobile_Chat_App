import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/contact/contact_ctrl.dart';

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
                          children: [Text(item.fullname ?? '')],
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
