import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'chat_items.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Chat"),
      ),
      body: const ChatList(),
    );
  }
}

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final List<ChatItem> chats = [
    ChatItem(name: 'Suraj ', message: 'Kya scene hai bhai?', time: '10:30 AM', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Ankitlyy', message: 'Boti chal kya raha hai?', time: '9:15 AM', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Arun', message: 'Pagl, tune kaam kiya?', time: 'Yesterday', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Pranav ', message: 'Sahi time pe milte hain kya?', time: '2 days ago', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Simona', message: 'Kal plan kya hai?', time: '3 days ago', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Dheraj ', message: 'Bhai tu kaha hai?', time: '4 days ago', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Sujal', message: 'Aaj badi badi baatein ho rahi hain!', time: '5 days ago', avatarUrl: 'assets/images/profilepic.png'),
    ChatItem(name: 'Gaurang', message: 'Kya chal raha hai?', time: 'Just now', avatarUrl: 'assets/images/profilepic.png'), // New entry
    ChatItem(name: 'Komal', message: 'Aaj ka kya plan hai?', time: '11:45 AM', avatarUrl: 'assets/images/profilepic.png'), // New entry
    ChatItem(name: 'Adi', message: 'Masti kar rahe ho?', time: '1 hour ago', avatarUrl: 'assets/images/profilepic.png'), // New entry
  ];

  List<ChatItem> filteredChats = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredChats = List.from(chats); // Initially display all chats
    filteredChats.sort((a, b) => a.name.trim().compareTo(b.name.trim())); // Sort the list alphabetically by name
  }

  void _filterChats(String query) {
    final results = chats.where((chat) {
      final chatNameLower = chat.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return chatNameLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredChats = results;
    });
  }

  void _clearSearch() {
    searchController.clear();
    _filterChats('');
    FocusScope.of(context).unfocus(); // Dismiss the keyboard when clearing the search
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SearchBar(
                controller: searchController,
                onChanged: _filterChats,
                onClear: _clearSearch,
              ),
              const Message(),
              const SizedBox(height: 8), // Add space between the heading and the list
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return ChatTile(chat: filteredChats[index]);
            },
            childCount: filteredChats.length,
          ),
        ),
      ],
    );
  }
}

class ChatTile extends StatelessWidget {
  final ChatItem chat;

  const ChatTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the chat detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(chat: chat),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        leading: CircleAvatar(
          backgroundImage: AssetImage(chat.avatarUrl),
          radius: 30,
        ),
        title: Text(
          chat.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
            color: Color(0xFF193238),
          ),
        ),
        subtitle: Text(
          chat.message,
          style: const TextStyle(fontFamily: "Nunito", color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          chat.time,
          style: const TextStyle(color: Colors.grey, fontFamily: "Nunito"),
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 4.0, // Shadow effect for better visual appearance
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEDEFF2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged, // Trigger filtering when text changes
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Color(0xFF7E858C)),
                    hintText: "Search Students",
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              // Container for the clear button with a border
              if (controller.text.isNotEmpty) // Show only when there's text
                Container(

                  child: IconButton(
                    icon: const Icon(Icons.clear, color: Color(0xFF7E858C)),
                    onPressed: onClear, // Clear the search bar and dismiss focus
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
