import 'package:chat_app/consts/kPrimaryColor.dart';
import 'package:chat_app/models/messageModel.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class bubbleChat extends StatelessWidget {
  const bubbleChat({required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message.message,
      color: kPrimaryColor,
      tail: false,
      textStyle: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
