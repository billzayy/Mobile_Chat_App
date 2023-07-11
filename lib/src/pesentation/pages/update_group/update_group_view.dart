import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              GestureDetector(onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
              // SizedBox(
              //   width: Get.width * 0.25,
              //   height: Get.width * 0.25,
              //   child: ClipOval(
              //     child: ExtendedImage.network(
              //       'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
              //       fit: BoxFit.cover,
              //       borderRadius: const BorderRadius.all(Radius.circular(5)),
              //       shape: BoxShape.rectangle,
              //       loadStateChanged: (ExtendedImageState state) {
              //         switch (state.extendedImageLoadState) {
              //           case LoadState.loading:
              //             return const Center(
              //               child: CircularProgressIndicator(),
              //             );
              //           case LoadState.completed:
              //             return null;
              //           case LoadState.failed:
              //             return Image.asset(
              //               ImageAssets.defaultUser,
              //             );
              //         }
              //       },
              //     ),
              //   ),
              // ),
              const Text('Tùy chọn'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [Icon(Icons.group_sharp), Text('thêm người vào để tạo nhóm ')],
                      ),
                      Row(
                        children: [Icon(Icons.search), Text('Tìm kiếm trong cuộc trò chuyện ')],
                      ),
                      Row(
                        children: [Icon(Icons.group_sharp), Text('tắt thông báo & âm thanh ')],
                      )
                    ],
                  ),
                ),
              ),
              const Text('Quyền riêng tư & hỗ trợ'),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [Icon(Icons.error_outline), Text('Hạn chế')],
                    ),
                    Row(
                      children: [Icon(Icons.error_outline), Text('chặn')],
                    ),
                    Row(
                      children: [Icon(Icons.error_outline), Text('Báo cáo')],
                    )
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                child: const Center(child: Text('Xóa Cuộc trò Truyện')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
