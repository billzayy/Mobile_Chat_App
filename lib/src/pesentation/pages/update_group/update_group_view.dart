import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/pesentation/pages/root_app.dart';
import 'package:software_project_3/src/pesentation/pages/update_group/update_group_ctrl.dart';

class UpdateGroupView extends GetView<UpdateGroupController> {
  static const String routerName = '/UpdateGroupView';
  const UpdateGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back_ios)),
                Column(
                  children: [
                    Obx(() => SizedBox(
                        height: 100,
                        child: controller.group.value?.groupType == 'private'
                            ? Obx(() => Column(
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.15,
                                      height: Get.width * 0.15,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipOval(
                                          child: ExtendedImage.network(
                                            controller.member.value?.pictures ==
                                                    null
                                                ? ''
                                                : controller.member.value
                                                        ?.pictures ??
                                                    '',
                                            fit: BoxFit.cover,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            shape: BoxShape.rectangle,
                                            loadStateChanged:
                                                (ExtendedImageState state) {
                                              switch (state
                                                  .extendedImageLoadState) {
                                                case LoadState.loading:
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.member.value?.fullname ??
                                              '',
                                          style:
                                              Get.theme.textTheme.titleMedium,
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.dialog(AlertDialog(
                                            title: const Text(
                                                'Chỉnh Sữa Biệt Hiệu'),
                                            content: SizedBox(
                                              height: 60,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: Colors
                                                                .deepPurple)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: TextField(
                                                        // onTap: () => controller.slideController.hide(),
                                                        controller: controller
                                                            .nameGroupEditController,

                                                        style: context
                                                            .theme
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                                // color: context.theme.hintColor,
                                                                ),
                                                        decoration: InputDecoration(
                                                            alignLabelWithHint:
                                                                true,
                                                            hintText:
                                                                'Enter your Name',
                                                            hintStyle: context
                                                                .theme
                                                                .textTheme
                                                                .bodyMedium
                                                                ?.copyWith(),
                                                            errorText: controller
                                                                .nameGroupError
                                                                .value,
                                                            border: InputBorder
                                                                .none),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                  child: const Text('Hủy'),
                                                  onPressed: () => Get.back()),
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                  child: const Text('Lưu'),
                                                  onPressed: () {
                                                    controller.updateUser();
                                                    // Navigator.of(context).pop();
                                                  }),
                                            ],
                                          )),
                                          child: const Icon(
                                            Icons.edit_outlined,
                                            color: Colors.deepPurple,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ))
                            : Obx(() => Column(
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.15,
                                      height: Get.width * 0.15,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipOval(
                                          child: ExtendedImage.network(
                                            controller.group.value?.pictures ==
                                                    ''
                                                ? ''
                                                : controller.group.value
                                                        ?.pictures ??
                                                    '',
                                            fit: BoxFit.cover,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            shape: BoxShape.rectangle,
                                            loadStateChanged:
                                                (ExtendedImageState state) {
                                              switch (state
                                                  .extendedImageLoadState) {
                                                case LoadState.loading:
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 50,
                                          child: Text(
                                            controller.group.value?.groupName ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                            textScaleFactor: 1,
                                            style:
                                                Get.theme.textTheme.titleMedium,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.dialog(AlertDialog(
                                            title: const Text(
                                                'Chỉnh Sửa Biệt Hiệu'),
                                            content: SizedBox(
                                              height: 60,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: Colors
                                                                .deepPurple)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: TextField(
                                                        // onTap: () => controller.slideController.hide(),
                                                        controller: controller
                                                            .nameGroupEditController,

                                                        style: context
                                                            .theme
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                                // color: context.theme.hintColor,
                                                                ),
                                                        decoration: InputDecoration(
                                                            alignLabelWithHint:
                                                                true,
                                                            hintText:
                                                                'Enter your Name',
                                                            hintStyle: context
                                                                .theme
                                                                .textTheme
                                                                .bodyMedium
                                                                ?.copyWith(),
                                                            errorText: controller
                                                                .nameGroupError
                                                                .value,
                                                            border: InputBorder
                                                                .none),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                  child: const Text('Hủy'),
                                                  onPressed: () => Get.back()),
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                  child: const Text('Lưu'),
                                                  onPressed: () {
                                                    controller.updateUser();
                                                    // Get.offNamed(
                                                    //     RootApp.routerName);
                                                  }),
                                            ],
                                          )),
                                          child: const Icon(
                                            Icons.edit_outlined,
                                            color: Colors.deepPurple,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ))))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Tùy chọn',
                    style: Get.theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.group_sharp,
                                color: Colors.deepPurple,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'thêm người vào để tạo nhóm ',
                                style: Get.theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.deepPurple,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Tìm kiếm trong cuộc trò chuyện ',
                                style: Get.theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.notifications_off,
                                color: Colors.deepPurple,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'tắt thông báo & âm thanh ',
                                style: Get.theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Quyền riêng tư & hỗ trợ',
                    style: Get.theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.production_quantity_limits,
                                color: Colors.deepPurple,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Hạn chế',
                                style: Get.theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.block,
                                color: Colors.deepPurple,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'chặn',
                                style: Get.theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.deepPurple,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Báo cáo',
                                style: Get.theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.exit_to_app_outlined),
                          Text(
                            'Xóa Cuộc trò Truyện',
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
