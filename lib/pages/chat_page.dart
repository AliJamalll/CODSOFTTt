import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/message_model.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
   ChatPage({super.key});
   static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
   CollectionReference messages = FirebaseFirestore.instance.collection(KmessagesCollection);

   TextEditingController TextFeildcontroller = TextEditingController();

   final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(
          descending: true,
            KCreatedAt
        ).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<Message> text = [];
            for(int i = 0; i < snapshot.data!.docs.length;i++){
              text.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,///to remove the back arrow
                  backgroundColor: KPrimaryColor,
                  title:
                      Text(
                        'Chat App',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Pacifico"
                        ),
                      ),


                  centerTitle: true,
                ),
                body: Column(
                  children:[
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: text.length,
                        itemBuilder: (BuildContext context, int index) {
                          return text[index].id == email ? CustomChatBubble(message: text[index],) :
                          CustomChatBubble2(message: text[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: TextFeildcontroller,
                        onSubmitted: (data){
                          messages.add({
                            Kmessage : data,
                            KCreatedAt : DateTime.now(),
                            'id' : email
                          });
                          TextFeildcontroller.clear();
                          _controller.animateTo(
                              0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn
                          );
                        },
                        decoration: InputDecoration(
                            hintText: 'Send message',
                            suffix: Icon(Icons.send,
                              color: KPrimaryColor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                    color: KPrimaryColor
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                    color: KPrimaryColor
                                ),
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: KPrimaryColor
                            ),
                          )
                        ),
                      ),
                    ),
                  ],
                )
            );
          }else{
            return Text('Loading');
          }
        }
    );
  }
}

