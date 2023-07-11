import 'dart:io';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localvariable.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:software_project_3/config/refech_api.dart';
import 'package:software_project_3/src/domain/model/group_model.dart';
import 'package:software_project_3/src/domain/model/message_model.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/group_service.dart';
import 'package:software_project_3/src/domain/service/message_service.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class RoomChatController extends GetxController {
  final RxList<MessageModel> messages = <MessageModel>[].obs;
  final NoTiConfig tinTucConfig = Get.find();
  final TextEditingController messageEditController = TextEditingController();
  final IO.Socket socket = IO.io('http://34.142.131.182:46762', IO.OptionBuilder().setTransports(['websocket']).build());
  int userId = 0;
  int? idGroup;
  int? idMember;
  File? imageFile;
  File? file;
  final Rxn<GroupModel> newGroup = Rxn<GroupModel>();
  final RxList<GroupModel> listGroup = <GroupModel>[].obs;
  final RxBool isLoading = true.obs;
  final Rxn<UserModel> member = Rxn<UserModel>();
  final MessageService _messageService = Get.find();
  final UserService _userService = Get.find();
  final GroupService _groupService = Get.find();
  final EventBus eventBus = Get.find();
  @override
  void onInit() {
    idGroup = Get.arguments['idGroup'];
    idMember = Get.arguments['idMember'];
    loadData();
    connectSocket();
    fetch();
   super.onInit();
 
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(LocalVariable.userId)!;

    fetchUser();
  }

  Future fetch() async {
    if (idGroup != null) {
      final ApiResponse<List<MessageModel>> res = await _messageService.getMessages(idGroup!);
      if (res.status == ApiResponseStatus.completed) {
        messages.call(res.data);
      } else {
        Get.log(res.message.toString());
      }
      isLoading.call(false);
    } else {
      messages.call(null);
    }

  }


  void connectSocket() {
    socket
      ..open()
      ..onConnect((data) => print("Connected with Socket"))
      ..onConnectError((data) => print("Fail to Connect $data"))
      ..onDisconnect((data) => null)
      ..on('chat-message', (data) {
        print(data);
        final newMessage = MessageModel.fromJson(data);
        messages.add(newMessage);
      });
  }


  void sendMessage() async {
    try {
      if (idGroup == null) {
        Map<String, dynamic> param = {
          "idMember": userId,
          "memberList": [
            idMember,
            userId,
          ],
          "groupType": "private",
          "groupName": "",
          "pictures": ""
        };
        final ApiResponse<GroupModel> res = await _groupService.createGroup(param);
        if (res.status == ApiResponseStatus.completed) {
          newGroup.call(res.data);
          listGroup.add(GroupModel.fromJson(param));
          idGroup = newGroup.value?.idGroup;
        } else {
          Get.log(res.message.toString());
        }
      }
    } catch (e) {
      return;
    }

    Map<String, dynamic> messages = {
      // "chatId": idGroupChat,
      "Sendby": userId,
      "IdGroup": idGroup,
      "Messages": messageEditController.text.trim(),
      "Type": 1,
      "Time": DateTime.now().millisecondsSinceEpoch.toString(),
    };
    if (messageEditController.text != '') {
      socket.emit('send-chat-message', messages);
      this.messages.add(MessageModel.fromJson(messages));
    }
    messageEditController.text = '';
    eventBus.fire(RefechEvent());
    // fetch();
  }

  Future getCameraImages() async {
    ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.camera).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        // uploadImage(imageFile!);
      }
    });
  }

  Future getGallery() async {
    ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        // uploadImage(imageFile!);
      }
    });
  }


  Future fetchUser() async {
    if (idMember != null) {
      final ApiResponse<UserModel> res = await _userService.getUserId(idMember!);
      if (res.status == ApiResponseStatus.completed) {
        member.call(res.data);
      } else {
        Get.log(res.message.toString());
      }
      isLoading.call(false);
    }
  }



  @override
  void onClose() {
    // TODO: implement onClose
    // socket.dispose();
    super.onClose();
  }
}
