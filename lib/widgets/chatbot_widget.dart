import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/widgets/constant.dart';

class ChatBotMessages extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const ChatBotMessages({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isUser = message["isUser"] as bool;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUser)
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Image.asset(
                  "assets/icons/literexia-avatar.png",
                  width: 40.w,
                  height: 40.h,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.account_circle, size: 40.w, color: Colors.grey);
                  },
                ),
              ),

            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.h),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: isUser ? PRIMARY_COLOR : Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  message["text"] as String, 
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: isUser ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ChatBotQuickHelp extends StatelessWidget {
  final Function(String) onOptionSelected;

  const ChatBotQuickHelp({super.key, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick help",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.h),

          _buildHelpOption("💡 Help me to understand this word", onOptionSelected),
          _buildHelpOption("📖 Explain this lesson", onOptionSelected),
          _buildHelpOption("🗣️ Practice pronunciation", onOptionSelected),
        ],
      ),
    );
  }

  Widget _buildHelpOption(String option, Function(String) onTap) {
    return GestureDetector(
      onTap: () => onTap(option),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Text(option, style: TextStyle(fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }
}

class ChatBotInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSend;

  const ChatBotInputField({super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller, 
              decoration: const InputDecoration(
                hintText: "Type your question here",
                border: InputBorder.none,
              ),
              onSubmitted: (text) {
                onSend(text);
                controller.clear();
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              onSend(controller.text);
              controller.clear();
            },
            child: const Icon(Icons.send, color: PRIMARY_COLOR),
          ),
        ],
      ),
    );
  }
}
