import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/message_model.dart';

class CustomChatBubble extends StatelessWidget {
   CustomChatBubble({super.key,required this.message});

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        // height: 65,
        // width: 150,
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),

            ),
            color: KPrimaryColor
        ),
        child: Text(
          message.text,
          style: const TextStyle(
            color: Colors.white,

          ),
        ),

      ),
    );
  }
}

class CustomChatBubble2 extends StatelessWidget {
  CustomChatBubble2({super.key,required this.message});

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        // height: 65,
        // width: 150,
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),

            ),
            color: Colors.teal
        ),
        child:  Text(
          message.text,
          style: TextStyle(
            color: Colors.white,

          ),
        ),
      ),
    );
  }
}

