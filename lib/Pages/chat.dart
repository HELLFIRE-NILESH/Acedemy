import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For setting the status bar style

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    // Set the status bar style (same as HomePage)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xFFF6F8F9),
      statusBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Class Chat",
            ),
          ),
          body: ChatList(),
        ),
    );
  }
}

class ChatList extends StatelessWidget {
  final List<ChatItem> chats = [
    ChatItem(name: 'Alice Johnson', message: 'Hey, did you complete the assignment?', time: '10:30 AM', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Michael Smith', message: 'Can we discuss the project?', time: '9:15 AM', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Emily Davis', message: 'Don\'t forget the meeting tomorrow.', time: 'Yesterday', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Daniel Brown', message: 'Check out the new resources.', time: '2 days ago', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Sophia Wilson', message: 'Can you help me with the homework?', time: '3 days ago', avatarUrl: 'assets/images/profilepic.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(),
        Message(),
        Expanded(
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ChatTile(chat: chats[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ChatTile extends StatelessWidget {
  final ChatItem chat;

  ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Same padding as HomePage
      leading: CircleAvatar(
        backgroundImage: AssetImage(chat.avatarUrl),
        radius: 30,
      ),
      title: Text(
        chat.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Nunito", // Consistent font
          color: Color(0xFF193238),
        ),
      ),
      subtitle: Text(
        chat.message,
        style: TextStyle(fontFamily: "Nunito", color: Colors.black),
      ),
      trailing: Text(
        chat.time,
        style: TextStyle(color: Colors.grey, fontFamily: "Nunito"),
      ),
    );
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Your Messages",
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Nunito",

          ),
        ),
      ),
    );
  }
}
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEDEFF2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Color(0xFF7E858C)), // Consistent icon color
            hintText: "Search Students",
            hintStyle: TextStyle(color: Color(0xFF7E858C), ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });
}
