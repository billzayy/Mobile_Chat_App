// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpView extends StatelessWidget {
  static const String routerName = '/HelpView';
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SupportCenterScreen(),
      ),
    );
  }
}

class SupportCenterScreen extends StatelessWidget {
  final List<Chat> chatList = [
    Chat('Customer Support 1', 'Last message 2', 'avatar1.jpg'),
    Chat('Customer Support 2', 'Last message 4', 'avatar2.jpg'),
    Chat('Customer Support 3', 'Last message 2', 'avatar3.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${chatList[index].avatar}'),
            ),
            title: Text(chatList[index].name),
            subtitle: Text(chatList[index].lastMessage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ChatDetailsScreen(chatList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Chat {
  final String name;
  final String lastMessage;
  final String avatar;

  Chat(this.name, this.lastMessage, this.avatar);
}

class ChatDetailsScreen extends StatelessWidget {
  final Chat chat;

  const ChatDetailsScreen(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.name),
      ),
      body: Column(
        children: [
          // Chat history widget
          Expanded(
            child: ListView(
              children: [
                // Display chat history here
              ],
            ),
          ),
          // Input field and send button
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Send message logic here
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





