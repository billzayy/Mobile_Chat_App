import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:software_project_3/src/pesentation/pages/contact/contact_view.dart';
import 'package:software_project_3/src/pesentation/pages/goup_chat/goup_chat_view.dart';
import 'package:software_project_3/src/pesentation/pages/list_chat/list_chat_view.dart';
import 'package:software_project_3/src/pesentation/pages/profile/profile_view.dart';

class RootApp extends StatefulWidget {
  static const routerName = '/RootApp';
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getTabs(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ListChatView(),
        GroupChatView(),
        ContactView(),
        ProFileView(),
        // ProfilePage(),
      ],
    );
  }

  Widget getTabs() {
    return SalomonBottomBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: List.generate(rootAppJson.length, (index) {
          return SalomonBottomBarItem(
              selectedColor: rootAppJson[index]['color'],
              icon: SvgPicture.asset(
                rootAppJson[index]['icon'],
                width: 26,
                colorFilter: ColorFilter.mode(
                    rootAppJson[index]['color'], BlendMode.srcIn),
              ),
              title: Text(rootAppJson[index]['text']));
        }));
  }
}

const List rootAppJson = [
  {
    "icon": "assets/icons/chats.svg",
    "text": "chats",
    "color": Color(0xff734DDE)
  },
  {
    "icon": "assets/icons/group.svg",
    "text": "Groups chat",
    "color": Color(0xff734DDE)
  },
  {
    "icon": "assets/icons/contact.svg",
    "text": "Contacts",
    "color": Color(0xff734DDE)
  },
  {
    "icon": "assets/icons/avatar.svg",
    "text": "Profile",
    "color": Color(0xff734DDE)
  }
];
