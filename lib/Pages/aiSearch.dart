import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:acedemy/api-Key.dart';

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  // Define the color scheme
  static const Color primaryColor = Color(0xFF193238);
  static const Color backgroundColor = Color(0xFFF6F8F9);
  static const Color accentColor = Color(0xFF193238);

  final List<String> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  // Rename context to chatContext
  String chatContext = '';

  void _sendMessage() async {
    final String message = _controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add("You: $message");
        chatContext += "You: $message\n"; // Update chatContext with user's message
      });
      _controller.clear();
      _scrollToBottom();

      setState(() {
        _isLoading = true; // Show loading animation
      });

      final String botResponse = await _getAIResponse(message);

      // Remove asterisks from the bot's response
      String formattedResponse = _formatBotResponse(botResponse);

      setState(() {
        messages.add("Bot: $formattedResponse");
        chatContext += "Bot: $formattedResponse\n"; // Update chatContext with bot's response
        _isLoading = false; // Hide loading animation
      });
      _scrollToBottom();
    }
  }

  Future<String> _getAIResponse(String message) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey, // Use the API key from the separate file
    );

    // Combine chatContext with the current message
    String fullContext = chatContext + "You: $message\n";

    try {
      final response = await model.generateContent([Content.text(fullContext)]);
      if (response != null && response.text != null && response.text!.isNotEmpty) {
        return response.text ?? "Bot couldn't understand.";
      } else {
        return "No response from the bot.";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  // Function to format the response by removing stars and applying bold style
  String _formatBotResponse(String response) {
    return response.replaceAll('**', ''); // Remove all '**' occurrences
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  // Function to clear the chat
  void _clearChat() {
    setState(() {
      messages.clear(); // Clear the messages list
      chatContext = ''; // Reset the chat context
    });
  }

  Widget _buildMessage(String message, bool isUser) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isUser ? accentColor : Colors.grey[300], // Set user bubble to accentColor
            borderRadius: BorderRadius.circular(15),
          ),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75), // Adjust width to 75% of the screen
          child: Text(
            message.substring(5), // Skip "You: " or "Bot: "
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
        title: Text('AI Chat Bot'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.clear), // Clear icon
            onPressed: () {
              _clearChat(); // Clear chat when pressed
            },
          ),
        ],
      ),
      body: Container(
        color: backgroundColor, // Set background color for the entire body
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == messages.length) {
                    return TypingIndicator(); // Show typing indicator when bot is typing
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
                      maxLines: null, // Allows multiline input
                      keyboardType: TextInputType.multiline, // Set keyboard type to multiline
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                      onSubmitted: (value) {
                        _sendMessage(); // Send message when Enter is pressed
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: accentColor), // Use accent color for send button
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Typing indicator with three bouncing dots
class TypingIndicator extends StatefulWidget {
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
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75), // Restrict width to 75% of the screen
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDot(0),
              SizedBox(width: 5),
              _buildDot(1),
              SizedBox(width: 5),
              _buildDot(2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 0.5).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0 + (index * 0.2), 0.5 + (index * 0.2), curve: Curves.easeInOut),
        ),
      ),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
