import 'package:flutter/material.dart';
import 'package:literexia/widgets/constant.dart';
import 'package:literexia/widgets/chatbot_widget.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      "text": "Hi! I'm your learning assistant \bLITEREXIA\b. How can I help you?",
      "isUser": false,
      "avatar": "assets/icons/literexia-avatar.png"
    }
  ];

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({
        "text": message,
        "isUser": true,
        "avatar": null, 
      });
      _messageController.clear();

      Future.delayed(const Duration(milliseconds: 500), () {
        _addBotResponse(message);
      });
    });
  }

  void _addBotResponse(String userMessage) {
    String botReply;

    if (userMessage.toLowerCase().contains("hello") || userMessage.toLowerCase().contains("hi")) {
      botReply = "Hello! How can I assist you today?";
    } else if (userMessage.toLowerCase().contains("help")) {
      botReply = "Sure! What do you need help with? You can select a Quick Help option below.";
    } else if (userMessage.toLowerCase().contains("word")) {
      botReply = "Would you like me to explain the meaning of a word?";
    } else if (userMessage.toLowerCase().contains("lesson")) {
      botReply = "I can guide you through this lesson. What part is unclear?";
    } else if (userMessage.toLowerCase().contains("pronunciation")) {
      botReply = "Let’s practice pronunciation together! Say the word after me.";
    } else if (userMessage.toLowerCase().contains("thank you")) {
      botReply = "You're welcome! I'm here to help anytime.";
    } else {
      botReply = "I'm here to assist you. Can you be more specific?";
    }

    setState(() {
      _messages.add({
        "text": botReply,
        "isUser": false,
        "avatar": "assets/icons/literexia-avatar.png"
      });
    });
  }

  void _handleQuickHelpSelection(String option) {
    _sendMessage(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Column(
        children: [
          Expanded(
            child: ChatBotMessages(messages: _messages),
          ),
          ChatBotQuickHelp(onOptionSelected: _handleQuickHelpSelection),
          ChatBotInputField(controller: _messageController, onSend: _sendMessage),
        ],
      ),
    );
  }
}
