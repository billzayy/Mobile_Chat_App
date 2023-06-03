import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/pages/goup_chat/group_chat_ctrl.dart';


class GroupChatView extends GetView<GroupChatController> {
  static const String routerName = '/GroupChatView';
  const GroupChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Group Chat',
      ),
      body: Column(
        children: [Text('data')],
      ),
    );
  }
}
