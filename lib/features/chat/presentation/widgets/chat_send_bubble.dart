import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/styles.dart';

class ChatSendBubble extends StatelessWidget {
  const ChatSendBubble({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Text(message, style: Styles.textStyle12Black),
      ),
    );
  }
}
