import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.onPressed,super.key,required this.text});

  String text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 155),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          children: [
            Text(text,style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
