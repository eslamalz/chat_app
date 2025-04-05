import 'package:flutter/material.dart';

class textformField extends StatelessWidget {
  textformField({this.hinttext, this.onChanged});
  Function(String)? onChanged;
  String? hinttext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'please type your info';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
    );
  }
}
