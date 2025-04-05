import 'package:chat_app/consts/kPrimaryColor.dart';
import 'package:chat_app/models/messageModel.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class friendbubbleChat extends StatelessWidget {
  const friendbubbleChat({required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      isSender: false,
      text: message.message,
      color: Colors.grey,
      tail: false,
      textStyle: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
