import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/profile/page_profile/update_user/update_user_ctrl.dart';

class UpdateUserView extends GetView<UpdateUserController> {
  static const String routerName = '/UpdateUserView';
  const UpdateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.colorScheme.onPrimary,
        title: Text(
          'Update Profile',
          style: Get.theme.textTheme.titleLarge?.copyWith(
              color: Get.theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text('')),
              Text(
                'Full Name',
                style: Get.theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 20,
              ),
              Text(
                'Phone Number',
                style: Get.theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 20,
              ),
              Text(
                'City',
                style: Get.theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[500],
                  ),
                  onPressed: () {
                    controller.onSend();
                    Get.back();
                  },
                  child: Text('Update',
                      style: Get.theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
