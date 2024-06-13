import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_Text_field.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static String id = 'LogInPage';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children:[
                Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset('assets/images/scholar.png',
                  height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scolar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: "Pacifico"
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onChanged: (data){
                      email = data;
                    },
                    hintText: 'Email',),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      onChanged: (data){
                        password = data;
                      },
                      hintText: 'Password'),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: ()async{
                      if(formKey.currentState!.validate()){
                        try{
                          isLoading = true;
                          setState(() {
                          });
                          await logInMethod();
                          SnakBarMethod(context,'Success');
                          Navigator.pushNamed(context, ChatPage.id);
                        }on FirebaseAuthException catch(e){
                          if(e.code == 'User-not-found'){
                            SnakBarMethod(context,'user not found');
                          }else if(e.code == 'wrong-password'){
                            SnakBarMethod(context,'wrong password');
                          }
                        }catch(e){
                          SnakBarMethod(context,'there was an error');
                        }
                        isLoading =false;
                        setState(() {

                        });
                      }
                    },

                    text: 'LOGIN',),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'don\'t have an account?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context){
                          //       return RegisterScreen();
                          //     })
                          // );
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: Text(
                          'Resgester',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
             ],
            ),
          ),
        ),
      ),
    );
  }

  void SnakBarMethod(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> logInMethod() async {
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!
    );
  }
}
