import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/config/refech_group.dart';
import 'package:software_project_3/src/domain/model/group_model.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/group_service.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';
import 'package:software_project_3/src/pesentation/pages/root_app.dart';

class UpdateGroupController extends GetxController {
  final TextEditingController nameGroupEditController = TextEditingController();
  final RxnString nameGroupError = RxnString(null);
  int userId = 0;
  int? idMember;
  int? idGroup;
  final Rxn<UserModel> member = Rxn<UserModel>();
  final Rxn<GroupModel> group = Rxn<GroupModel>();
  final UserService _userService = Get.find();
  final RxBool isLoading = true.obs;
  final GroupService _groupService = Get.find();
  final NoTiConfig tinTucConfig = Get.find();
  final EventBus eventBus = Get.find();

  @override
  void onInit() {
    idGroup = Get.arguments['idGroup'];
    idMember = Get.arguments['idMember'];
    fetch();
    super.onInit();
  }

  Future fetch() async {
    if (idGroup != null) {
      final ApiResponse<GroupModel> res =
          await _groupService.getGroup(idGroup!);
      if (res.status == ApiResponseStatus.completed) {
        group.call(res.data);
        nameGroupEditController.text = group.value?.groupName ?? '';
        fetchUser();
      } else {
        Get.log(res.message.toString());
      }
      isLoading.call(false);
    }
  }

  Future fetchUser() async {
    if (idMember != null) {
      final ApiResponse<UserModel> res =
          await _userService.getUserId(idMember!);
      if (res.status == ApiResponseStatus.completed) {
        member.call(res.data);
      } else {
        Get.log(res.message.toString());
      }
      isLoading.call(false);
    }
  }

  Future updateUser() async {
    Map<String, dynamic> param = {
      "idGroup": group.value?.idGroup,
      "memberList": [
        ...List.generate(group.value!.idMember!.length,
            (int index) => group.value?.idMember?[index].idUser),
      ], // tao 1 li,
      "groupType": group.value?.groupType,
      "groupName": nameGroupEditController.text.trim(),
      "pictures": group.value?.pictures,
    };
    final ApiResponse<String> res = await _groupService.updateFroup(param);
    if (res.status == ApiResponseStatus.completed) {
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'Update Thành Công <3',
          backgroundColor: Get.theme.colorScheme.primary);
      fetch();
      fetchUser();
      eventBus.fire(RefechGroup());
      Get.offNamed(RootApp.routerName);
    } else {
      // Get.log(res.message.toString());
      tinTucConfig.showSnackBar(
          title: 'Thông báo',
          'update thất bại vui lòng thử lại !',
          backgroundColor: Colors.orangeAccent);
    }
    isLoading.call(false);
  }
}
