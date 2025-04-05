import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/reigester.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(chatApp());
}

class chatApp extends StatelessWidget {
  const chatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        loginPage.id: (context) => loginPage(),
        ReigsterPage.id: (context) => ReigsterPage(),
        chatPage.id: (context) => chatPage(),
      },
      initialRoute: loginPage.id,
    );
  }
}
