import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.hintText});

  String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            borderSide: BorderSide(
                color: Colors.white
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            borderSide: BorderSide(
                color: Colors.blue
            ),
          ),
          border: OutlineInputBorder(///دي حاله عامله للبوردر
            borderSide: BorderSide(
                color: Colors.white
            ),
          )
      ),
    );
  }
}
