import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios)),
              Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: controller.groupModel.groupType == 'private'
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.groupModel.idMember!.length,
                              itemBuilder: (context, index) {
                                var itemUser =
                                    controller.groupModel.idMember![index];
                                if (itemUser.idUser != controller.userId) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.2,
                                        height: Get.width * 0.2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: ClipOval(
                                            child: ExtendedImage.network(
                                              itemUser.pictures ?? '',
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
                                      Text(
                                        itemUser.fullname == ""
                                            ? "UserName"
                                            : itemUser.fullname!,
                                        style: Get.theme.textTheme.titleMedium,
                                      ),
                                    ],
                                  );
                                }
                                return const SizedBox.shrink();
                              })
                          : Column(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.2,
                                  height: Get.width * 0.2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ClipOval(
                                      child: ExtendedImage.network(
                                        controller.groupModel.pictures ?? '',
                                        fit: BoxFit.cover,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        shape: BoxShape.rectangle,
                                        loadStateChanged:
                                            (ExtendedImageState state) {
                                          switch (
                                              state.extendedImageLoadState) {
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
                                Text(
                                  controller.groupModel.groupName ?? '',
                                  style: Get.theme.textTheme.titleMedium,
                                ),
                              ],
                            ))
                ],
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
    );
  }
}
