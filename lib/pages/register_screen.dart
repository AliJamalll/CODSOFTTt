
import 'package:chatapp/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_Text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 170,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chat App',
                          style: TextStyle(
                              fontSize: 32,
                              color: KPrimaryColor,
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
                          'REGISTER',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24,
                            color: KPrimaryColor,
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
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        obscureText: true,
                        onChanged: (data){
                        password = data;
                      },
                        hintText: 'Password'
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: ()async{
                        if(formKey.currentState!.validate()){
                          isLoading = true;
                          setState(() {

                          });
                          try{
                            await registerMethod();
                            showSnackPar(context,'Success');
                            Navigator.pushNamed(context, ChatPage.id);
                          }on FirebaseAuthException catch(e){
                            if(e.code == 'weak-password'){
                              showSnackPar(context,'weak password');
                            }else if(e.code == 'email-already-in-use'){
                              showSnackPar(context,'email already exists');
                            }
                          }catch(e){
                            //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                            showSnackPar(context,'there was an error');
                          }
                          isLoading = false;
                          setState(() {

                          });
                        }else{

                        }
                        },
                      text: 'REGISTER',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have an account?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'LOGIN',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
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

  void showSnackPar(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> registerMethod() async {
    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!
    );
  }
}
