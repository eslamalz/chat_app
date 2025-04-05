import 'package:chat_app/consts/kPrimaryColor.dart';
import 'package:chat_app/models/messageModel.dart';
import 'package:chat_app/widget/bubbleChat.dart';
import 'package:chat_app/widget/friendchatbubble.dart';
import 'package:chat_app/widget/textfield.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chatPage extends StatelessWidget {
  chatPage({super.key});
  static String id = 'chatPage';
  CollectionReference messages =
      FirebaseFirestore.instance.collection('message');
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var Email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('creatAt').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 50,
                  ),
                  Text(
                    'chat',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(children: [
              Expanded(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == Email
                        ? bubbleChat(message: messagesList[index])
                        : friendbubbleChat(message: messagesList[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    messages.add({
                      'message': data,
                      'creatAt': DateTime.now(),
                      'id': Email,
                    });
                    controller.clear();
                    _controller.animateTo(
                      _controller.position.maxScrollExtent,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 1000),
                    );
                  },
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                      hintText: 'type your message',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              )
            ]),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text('Loading...')),
          );
        }
      },
    );
  }
}
