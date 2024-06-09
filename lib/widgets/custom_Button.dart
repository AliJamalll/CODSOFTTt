import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 140),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Text(text)
          ],
        ),
      ),
    );
  }
}
