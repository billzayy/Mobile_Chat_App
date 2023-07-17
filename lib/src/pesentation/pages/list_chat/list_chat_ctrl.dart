import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/config/refech_api.dart';
import 'package:software_project_3/src/domain/model/group_model.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/group_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class ListChatController extends GetxController {
  final RxList<GroupModel> listPrivate = <GroupModel>[].obs;
  final RxList<UserModel> user = <UserModel>[].obs;
  final RxBool isLoading = true.obs;
  final GroupService _groupService = Get.find();
  int userId = 0;
  final Rxn<UserModel> member = Rxn<UserModel>();
  EventBus eventBus = Get.find();
  StreamSubscription? streamSubscription;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
    listenEventClear();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(LocalVariable.userId)!;
    fetch();
  }

  Future fetch() async {
    final ApiResponse<List<GroupModel>> res =
        await _groupService.getAllGroup(userId);
    if (res.status == ApiResponseStatus.completed) {
      listPrivate.call(res.data);
    } else {
      Get.log(res.message.toString());
    }
    isLoading.call(false);
  }

  void listenEventClear() {
    streamSubscription = eventBus.on<RefechEvent>().listen((event) {
      fetch();
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
