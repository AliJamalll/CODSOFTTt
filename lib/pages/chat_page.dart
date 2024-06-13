import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
   CollectionReference messages = FirebaseFirestore.instance.collection(KmessagesCollection);

   TextEditingController controller = TextEditingController();
   static String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context,snapshot){
        //  print(snapshot.data!['text']);
          if(snapshot.hasData){
            print(snapshot.data!.docs[0]['text']);
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,///to remove the back arrow
                  backgroundColor: KPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/scholar.png",
                        height: 50,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children:[
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return  CustomChatBubble();

                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data){
                          messages.add({
                            'text' : data,
                          });
                          controller.clear();
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
                                )
                            )
                        ),
                      ),
                    ),
                  ],
                )
            );
          }else{
            return Text('Loasding');
          }
        }
    );
  }
}

