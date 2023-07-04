import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/pesentation/common_widgets/loading_shimmer.dart';
import 'package:software_project_3/src/pesentation/pages/group_chat/group_chat_ctrl.dart';

class CreateGroupView extends StatelessWidget {
  static const String routerName = '/CreateGroupView';
  const CreateGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GroupChatController());
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      width: Get.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: () => Get.back(), child: Icon(Icons.close)),
                Text(
                  'Nhóm Mới',
                  style: Get.theme.textTheme.bodyLarge,
                ),
                Text(
                  'Tạo',
                  style: Get.theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                // controller: controller.tenDoanhNghiepEditController,
                style: context.theme.textTheme.bodyMedium?.copyWith(),
                decoration: InputDecoration(
                    hintText: "Tên Nhóm (Không bắt Buộc)",
                    hintStyle: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
            Container(
              height: Get.height * 0.06,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xfff3f3f4)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextFormField(
                  // controller: controller.tenDoanhNghiepEditController,
                  style: context.theme.textTheme.bodyMedium?.copyWith(),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: context.theme.textTheme.bodyMedium,
                      prefixIcon: const Icon(Icons.search_outlined),
                      border: InputBorder.none),
                ),
              ),
            ),
            Obx(() {
              return (controller.listUserDaChon.isNotEmpty)
                  ? SizedBox(
                      height: 120,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listUserDaChon.length,
                          itemBuilder: (context, index) {
                            var item = controller.listUserDaChon[index];
                            return Column(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.2,
                                  height: Get.width * 0.2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ClipOval(
                                      child: ExtendedImage.network(
                                        item.pictures ?? '',
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
                                SizedBox(
                                    width: 80,
                                    child: Text(
                                      item.fullname ?? '',
                                      style: Get.theme.textTheme.bodyMedium,
                                    )),
                              ],
                            );
                          }),
                    )
                  : const SizedBox.shrink();
            }),
            const Text('Gợi ý'),
            const ListUserView()
          ],
        ),
      ),
    );
  }
}

class ListUserView extends GetView<GroupChatController> {
  const ListUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const LoadingShimmer();
          } else {
            return ListView.separated(
              itemCount: controller.listUser.length,
              itemBuilder: (context, index) {
                var item = controller.listUser[index];
                // if (controller.listUserDaChon.contains(
                //   ListMenber(
                //     id: item.idUser!,
                //     name: item.fullname ?? '',
                //     photoURL: item.pictures ??'',
                //   ),
                // )
                return GestureDetector(
                  onTap: () => controller.selectListUser(item),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.2,
                        height: Get.width * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipOval(
                            child: ExtendedImage.network(
                              item.pictures ?? '',
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
                        item.fullname ?? '',
                        style: Get.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                  indent: 70,
                  endIndent: 10,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ListMenber {
  final int id;
  final String name;
  final String photoURL;

  ListMenber({
    required this.id,
    required this.name,
    required this.photoURL,
  });

  // so sanh 2 list
  @override
  bool operator ==(Object other) => (identical(this, other) || (other is ListMenber && id == other.id));
}
