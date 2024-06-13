import 'package:flutter/material.dart';

import '../constants.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(16),
        // height: 65,
        // width: 150,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),

            ),
            color: KPrimaryColor
        ),
        child: Text(
          'I am a new user',
          style: TextStyle(
            color: Colors.white,

          ),
        ),
      ),
    );
  }
}
