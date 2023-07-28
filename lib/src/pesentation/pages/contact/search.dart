// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:software_project_3/config/assets.dart';
// import 'package:software_project_3/src/pesentation/common_widgets/custom_no_data_widget.dart';
// import 'package:software_project_3/src/pesentation/pages/contact/contact_ctrl.dart';
//
// class SearchUser extends GetView<ContactController> {
//   static const String routeName = '/SearchUser';
//
//   const SearchUser({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(kToolbarHeight),
//         child: Obx(() {
//           if (controller.isSearch.isTrue) {
//             return AppBar(
//               title: TextField(
//                 controller: controller.searchTinTucController,
//                 cursorColor: Colors.white,
//                 autofocus: true,
//                 style: context.theme.textTheme.titleMedium?.copyWith(
//                   color: context.theme.colorScheme.onPrimary,
//                 ),
//                 onSubmitted: (v) async {
//                   await controller.search(keySearch: v, refresh: true);
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Tìm kiếm",
//                   hintStyle: context.theme.textTheme.titleMedium?.copyWith(
//                       // color: context.theme.colorScheme.onPrimary,
//                       ),
//                   border: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                 ),
//               ),
//               centerTitle: true,
//               actions: [
//                 IconButton(
//                   onPressed: () => controller.searchTinTucController.text = '',
//                   icon: const Icon(
//                     Icons.close,
//                     size: 30,
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             );
//           }
//           return AppBar(
//             title: const Text(
//               'Tìm Kiếm',
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.start,
//               maxLines: 1,
//             ),
//             centerTitle: true,
//             actions: [
//               IconButton(
//                 onPressed: () => controller.isSearch.value = true,
//                 icon: const Icon(
//                   Icons.search,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           );
//         }),
//       ),
//       body: Stack(
//         children: [
//           RefreshIndicator(
//             onRefresh: () async {
//               await controller.search(keySearch: '', refresh: true);
//             },
//             child: Obx(
//               () {
//                 if (controller.isLoading.isTrue) {
//                   return const CircularProgressIndicator();
//                 } else {
//                   if (controller.userSearch.isEmpty) {
//                     return const CustomNoDataWidget(
//                       noiDung: 'Không có dữ liệu',
//                       isSearch: false,
//                     );
//                   }
//                   return ListView.builder(
//                       padding: const EdgeInsets.only(left: 12, right: 12),
//                       itemCount: controller.userSearch.length,
//                       itemBuilder: (context, index) {
//                         final item = controller.userSearch[index];
//                         return Card(
//                             margin: const EdgeInsets.only(top: 10, bottom: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   width: Get.width * 0.2,
//                                   height: Get.width * 0.2,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(12.0),
//                                     child: ClipOval(
//                                       child: ExtendedImage.network(
//                                         item.pictures ?? '',
//                                         fit: BoxFit.cover,
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(5)),
//                                         shape: BoxShape.rectangle,
//                                         loadStateChanged:
//                                             (ExtendedImageState state) {
//                                           switch (
//                                               state.extendedImageLoadState) {
//                                             case LoadState.loading:
//                                               return const Center(
//                                                 child:
//                                                     CircularProgressIndicator(),
//                                               );
//                                             case LoadState.completed:
//                                               return null;
//                                             case LoadState.failed:
//                                               return Image.asset(
//                                                 ImageAssets.defaultUser,
//                                               );
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       item.fullname ?? '',
//                                       style: Get.theme.textTheme.titleMedium,
//                                     ),
//                                     Text(
//                                       item.status ?? '',
//                                       style: Get.theme.textTheme.titleSmall,
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ));
//                       });
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
