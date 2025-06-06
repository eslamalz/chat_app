import 'package:chat_app/consts/kPrimaryColor.dart';
import 'package:flutter/foundation.dart';

class Message {
  final String message;
  final String id;
  Message(this.message, this.id);
  factory Message.fromJson(jsonData) {
    return Message(jsonData['message'], jsonData['id']);
  }
}
