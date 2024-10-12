import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:acedemy/api-Key.dart';
import 'dart:async';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  static const Color primaryColor = Color(0xFF193238);
  static const Color backgroundColor = Color(0xFFF6F8F9);
  static const Color accentColor = Color(0xFF193238);

  final List<String> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _showScrollDownButton = false;

  String chatContext = '';

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _showScrollDownButton = _scrollController.offset < _scrollController.position.maxScrollExtent - 100;
      });
    });
  }

  void _sendMessage() async {
    String message = _controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add("You: $message");
        chatContext += "You: $message\n";
      });
      _controller.clear();
      _scrollToBottom();

      setState(() {
        _isLoading = true;
      });

      final String botResponse = await _getAIResponse(message);
      _displayBotResponseWordByWord(botResponse);
    }
  }

  Future<String> _getAIResponse(String message) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );

    String fullContext = "${chatContext}You: $message";

    try {
      final response = await model.generateContent([Content.text(fullContext)]);
      if (response.text != null && response.text!.isNotEmpty) {
        String botResponse = response.text ?? "Bot couldn't understand.";
        botResponse = _removeEcho(botResponse, message);
        botResponse = _formatBotResponse(botResponse);

        return botResponse;
      } else {
        return "No response from the bot.";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  String _removeEcho(String response, String userMessage) {
    if (response.startsWith("You: $userMessage")) {
      return response.replaceFirst("You: $userMessage", '').trim();
    }
    return response;
  }

  String _formatBotResponse(String response) {
    return response.replaceAll('*', '');
  }

  void _displayBotResponseWordByWord(String botResponse) {
    List<String> words = botResponse.split(' ');
    String currentResponse = '';
    int index = 0;

    Timer.periodic(const Duration(milliseconds: 50), (timer) { // Adjusted the speed to synchronize with scroll speed
      if (index < words.length) {
        setState(() {
          currentResponse += '${words[index]} ';
          if (messages.isNotEmpty && messages.last.startsWith("Bot: ")) {
            messages[messages.length - 1] = "Bot: $currentResponse";
          } else {
            messages.add("Bot: $currentResponse");
          }
          chatContext += "Bot: $currentResponse\n";
        });
        _scrollToBottom(); // Ensure scrolling is synchronized with the response display
        index++;
      } else {
        timer.cancel();
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 50), () { // Adjusted for better sync
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeOut,
      );
    });
  }

  void _clearChat() {
    setState(() {
      messages.clear();
      chatContext = '';
    });
  }

  Widget _buildMessage(String message, bool isUser) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isUser ? accentColor : Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75),
          child: Text(
            message.substring(5),
            style: TextStyle(
              color: isUser ? Colors.white : Colors.black87,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chat Bot'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _clearChat,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: backgroundColor,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length + (_isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        return const TypingIndicator();
                      }
                      final isUser = messages[index].startsWith("You:");
                      return _buildMessage(messages[index], isUser);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          minLines: 1,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                          ),
                          onSubmitted: (value) {
                            _sendMessage();
                          },
                        ),
                      ),
                      const SizedBox(width: 8), // Add spacing between TextField and button
                      IconButton(
                        icon: const Icon(Icons.send, color: accentColor),
                        onPressed: _sendMessage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_showScrollDownButton) // Only show the button when necessary
            Positioned(
              bottom: 80,
              right: 16,
              child: FloatingActionButton(
                backgroundColor: accentColor,
                onPressed: _scrollToBottom,
                shape: const CircleBorder(),
                child: const Icon(Icons.arrow_downward),
              ),
            ),
        ],
      ),
    );
  }
}

// Typing indicator with three bouncing dots
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDot(0),
              const SizedBox(width: 5),
              _buildDot(1),
              const SizedBox(width: 5),
              _buildDot(2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, 1.0, curve: Curves.easeInOut),
        ),
      ),
      child: const CircleAvatar(
        radius: 4,
        backgroundColor: Colors.black,
      ),
    );
  }
}
