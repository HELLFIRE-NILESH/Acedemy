import 'package:flutter/material.dart';
import 'chat_items.dart';
import 'profile.dart';

class ChatPage extends StatefulWidget {
  final ChatItem chat;

  const ChatPage({super.key, required this.chat});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  final ScrollController _scrollController = ScrollController();

  static const Color primaryColor = Color(0xFF193238);
  static const Color backgroundColor = Color(0xFFF6F8F9);
  static const Color accentColor = Color(0xFF193238);

  @override
  void initState() {
    super.initState();
    // Initialize default messages
    messages = [
      {'text': 'Bhai, kya scene hai?', 'isUser': false},
      {'text': 'Tu kya kar raha hai aaj kal?', 'isUser': true},
      {'text': 'Arey, main toh aa raha hu!', 'isUser': false},
      {'text': 'Pagal hai kya, aise mat kar!', 'isUser': false},
    ];
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add({'text': _messageController.text, 'isUser': true});
        _messageController.clear();

        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            messages.add({'text': 'Samjha, bhai! Sab badiya!', 'isUser': false});
          });
          _scrollToBottom();
        });
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0.0,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  username: widget.chat.name,
                ),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.chat.avatarUrl),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Text(
                widget.chat.name,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['isUser'];

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isUser)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(widget.chat.avatarUrl), // Display the chat user's avatar
                            radius: 15, // Avatar size
                          ),
                        ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: isUser ? accentColor : Colors.grey.shade300,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(12),
                              topRight: const Radius.circular(12),
                              bottomLeft: isUser ? const Radius.circular(12) : const Radius.circular(0),
                              bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            message['text'],
                            style: TextStyle(
                              fontSize: 16,
                              color: isUser ? Colors.white : primaryColor,
                            ),
                          ),
                        ),
                      ),
                      if (isUser)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(widget.chat.avatarUrl), // Display the user's avatar
                            radius: 15, // Avatar size
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              minLines: 1,
              maxLines: 4,
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Type a message",
                hintStyle: const TextStyle(color: primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: primaryColor,
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
