import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project_3/config/localVariable.dart';
import 'package:software_project_3/config/noti_config.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:software_project_3/src/domain/model/message_model.dart';
import 'package:software_project_3/src/domain/service/message_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class RoomChatController extends GetxController {
  final RxList<MessageModel> messages = <MessageModel>[].obs;
  final NoTiConfig tinTucConfig = Get.find();
  final TextEditingController messageEditController = TextEditingController();
  final IO.Socket socket = IO.io('http://34.142.131.182:46762',
      IO.OptionBuilder().setTransports(['websocket']).build());
  int userId = 0;
  File? imageFile;
  File? file;
  final RxBool isLoading = true.obs;
  final MessageService _messageService = Get.find();
  @override
  void onInit() {
    loadData();
    connectSocket();
    fetch();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(LocalVariable.userId)!;
  }

  Future fetch() async {
    final ApiResponse<List<MessageModel>> res =
        await _messageService.getMessages();
    if (res.status == ApiResponseStatus.completed) {
      messages.call(res.data);
    } else {
      Get.log(res.message.toString());
    }
    isLoading.call(false);
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

  void sendMessage() {
    Map<String, dynamic> messages = {
      // "chatId": idGroupChat,
      "Sendby": userId,
      "IdGroup": 1,
      "Messages": messageEditController.text.trim(),
      "Type": 1,
      "Time": DateTime.now().millisecondsSinceEpoch.toString(),
    };
    if (messageEditController.text != '') {
      socket.emit('send-chat-message', messages);
      this.messages.add(MessageModel.fromJson(messages));
    }
    messageEditController.text = '';
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

  @override
  void onClose() {
    // TODO: implement onClose
    // socket.dispose();
    super.onClose();
  }
}
