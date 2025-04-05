import 'dart:math';
import 'package:chat_app/helper/show_snackbar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/widget/cusombuttom.dart';
import 'package:chat_app/widget/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReigsterPage extends StatefulWidget {
  ReigsterPage({super.key});
  static String id = 'Reigester Page';
  @override
  State<ReigsterPage> createState() => _ReigsterPageState();
}

class _ReigsterPageState extends State<ReigsterPage> {
  String? Email;

  String? Password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();
  static String id = 'Reigester Page';
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Spacer(
                  flex: 2,
                ),
                Image.asset('assets/images/scholar.png'),
                Text(
                  "Chat App",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      fontFamily: 'Pacifico'),
                ),
                Spacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    Text(
                      'REIGESTER',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textformField(
                    onChanged: (data) {
                      Email = data;
                    },
                    hinttext: 'Email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textformField(
                    onChanged: (data) {
                      Password = data;
                    },
                    hinttext: 'Password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textformField(
                    hinttext: 'Re-Password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customButon(
                    onTap: () async {
                      isLoading = true;
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await regesterUser();
                          Navigator.pushNamed(context, chatPage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackbar(context, 'weak password');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackbar(context, 'email already used before');
                          }
                        } catch (e) {
                          showSnackbar(
                              context, 'please inter email and password');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    butontext: 'REIGESTER',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return loginPage();
                        }));
                      },
                      child: Text(
                        "   Sign in",
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> regesterUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email!, password: Password!);
  }
}
