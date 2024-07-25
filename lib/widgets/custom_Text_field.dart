
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.onChanged,super.key,this.hintText,this.obscureText = false});

   Function(String)? onChanged;
   String? hintText;
   bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data){
        if(data!.isEmpty){
          return 'Field is required';
        }
      },
      onChanged:onChanged ,
      decoration: InputDecoration(
        hintText: hintText,
          hintStyle: TextStyle(
            color: KPrimaryColor
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            borderSide: BorderSide(
                color: KPrimaryColor
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            borderSide: BorderSide(
                color: KPrimaryColor
            ),
          ),
          border: OutlineInputBorder(///دي حاله عامله للبوردر
            borderSide: BorderSide(
                color: KPrimaryColor
            ),
          )
      ),
    );
  }
}
