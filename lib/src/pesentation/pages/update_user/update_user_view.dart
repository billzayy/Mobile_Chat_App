import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/update_user/update_user_ctrl.dart';

class UpdateUserView extends GetView<UpdateUserController> {
  static const String routerName = '/UpdateUserView';
  const UpdateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('update name'),
      ),
      body: Column(
        children: [
          Center(child: Text('update')),
          Text(
            'Full Name',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () => TextField(
              // onTap: () => controller.slideController.hide(),
              controller: controller.fullNameEditController,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  // color: context.theme.hintColor,
                  ),
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Enter your full name',
                  hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                  errorText: controller.fullNameError.value,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Text(
            'phone',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () => TextField(
              keyboardType: TextInputType.number,
              // onTap: () => controller.slideController.hide(),
              controller: controller.phoneEditController,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  // color: context.theme.hintColor,
                  ),
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Enter your phone number',
                  hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                  errorText: controller.fullNameError.value,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Text(
            'city',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () => TextField(
              // onTap: () => controller.slideController.hide(),
              controller: controller.cityEditController,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  // color: context.theme.hintColor,
                  ),
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Enter your city',
                  hintStyle: context.theme.textTheme.bodyMedium?.copyWith(),
                  errorText: controller.fullNameError.value,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          ElevatedButton(
              onPressed: () => controller.onSend(), child: Text('update'))
        ],
      ),
    );
  }
}
