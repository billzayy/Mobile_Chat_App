import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/src/domain/model/group_model.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/group_service.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';
import 'package:software_project_3/src/pesentation/pages/room_chat/room_chat_view.dart';

import '../../../../config/localvariable.dart';

class GroupChatController extends GetxController {
  final RxList<UserModel> listUser = <UserModel>[].obs;
  final Rxn<GroupModel> newGroup = Rxn<GroupModel>();
  final RxList<GroupModel> listGroup = <GroupModel>[].obs;
  final RxBool isLoading = true.obs;
  final UserService _userService = Get.find();
  final RxList<UserModel> listUserDaChon = <UserModel>[].obs;
  final GroupService _groupService = Get.find();
  final NoTiConfig tinTucConfig = Get.find();
  final TextEditingController nameGroupEditController = TextEditingController();
  int userId = 0;
  String fullName = '';
  @override
  void onInit() {
    loadData();
    fetch();

    super.onInit();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(LocalVariable.userId)!;
    fullName = prefs.getString(LocalVariable.userName) ?? '';
    fetchGroup();
  }

  Future fetch() async {
    final ApiResponse<List<UserModel>> res = await _userService.getUser();
    if (res.status == ApiResponseStatus.completed) {
      listUser.call(res.data);
    } else {
      Get.log(res.message.toString());
    }
    isLoading.call(false);
  }

  void selectListUser(UserModel value) {
    if (!listUserDaChon.contains(value)) {
      listUserDaChon.add(value);
    } else {
      listUserDaChon.remove(value);
    }
  }

  void deleteMember(UserModel value) {
    listUserDaChon.remove(value);
  }

  Future fetchGroup() async {

    final ApiResponse<List<GroupModel>> res = await _groupService.getGroup(userId);
    if (res.status == ApiResponseStatus.completed) {
      listGroup.call(res.data);
    } else {
      Get.log(res.message.toString());
    }
    isLoading.call(false);
  }

  Future createGroup() async {
    Map<String, dynamic> param = {
      "idMember": userId,
      "memberList": [...List.generate(listUserDaChon.length, (int index) => listUserDaChon[index].idUser), userId],
      "groupType": 'group',
      "groupName": nameGroupEditController.text.isEmpty
          ? [...List.generate(listUserDaChon.length, (int index) => listUserDaChon[index].fullname), fullName].join(',')
          : nameGroupEditController.text.trim(),
      "pictures": ''
    };
    final ApiResponse<GroupModel> res = await _groupService.createGroup(param);
    if (res.status == ApiResponseStatus.completed) {
      newGroup.call(res.data);
      fetchGroup();
      Get.toNamed(RoomChatView.routerName, arguments: {
        'idGroup': newGroup.value?.idGroup,
      });
    } else {
      // Get.log(res.message.toString());
      tinTucConfig.showSnackBar(title: 'Thông báo', 'Tạo nhóm thất bại vui lòng thử lại sau!', backgroundColor: Colors.orangeAccent);
    }
    isLoading.call(false);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
