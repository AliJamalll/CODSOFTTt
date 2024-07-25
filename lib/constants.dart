import 'package:flutter/material.dart';

const KPrimaryColor = Color(0xff447055);
const KmessagesCollection = 'messages';

const Kmessage = 'text';
const KCreatedAt = 'createdAt';

myStyle({double? size = 14, color = KPrimaryColor,weight = FontWeight.normal}){
  return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight
  );
}
