import 'package:flutter/material.dart';

class customButon extends StatelessWidget {
  customButon({this.butontext, this.onTap});
  String? butontext;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Text(
          '$butontext',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
