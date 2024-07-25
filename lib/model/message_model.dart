import '../constants.dart';

class Message{
  final String text;
  final String id;
  Message(this.text, this.id);

  factory Message.fromJson( jsonData){
    return Message(jsonData[Kmessage],jsonData['id']);
  }
}