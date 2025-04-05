import 'package:chat_app/consts/kPrimaryColor.dart';
import 'package:chat_app/helper/show_snackbar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/reigester.dart';
import 'package:chat_app/widget/cusombuttom.dart';
import 'package:chat_app/widget/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class loginPage extends StatefulWidget {
  loginPage({super.key});
  static String id = 'Login Page';
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String? Email, Password;

  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();
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
                      'Login',
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
                  child: customButon(
                    onTap: () async {
                      isLoading = true;
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          Navigator.pushNamed(context, chatPage.id,
                              arguments: Email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackbar(
                                context, 'No user found for that email');
                          } else if (e.code == 'wrong-password') {
                            showSnackbar(context,
                                'Wrong password provided for that user');
                          }
                        } catch (e) {
                          showSnackbar(
                              context, 'please inter email and password');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    butontext: 'Login',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "if you dont have account regester",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ReigsterPage();
                        }));
                      },
                      child: Text(
                        "   Sign up",
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

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email!, password: Password!);
  }
}
