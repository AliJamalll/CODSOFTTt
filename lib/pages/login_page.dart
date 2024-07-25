import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

class _LogInPageState extends State<LogInPage> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  String? email;
  String? password;

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
                        AnimatedBuilder(
                            animation: slidingAnimation,
                            builder: (context, _) {
                              return SlideTransition(
                                position: slidingAnimation,
                                child: const Text(
                                  'Chat App',
                                  style: TextStyle(
                                      fontSize: 32,
                                      color: KPrimaryColor,
                                      fontFamily: "Pacifico"
                                  ),
                                ),
                              );
                            }
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
                              color: KPrimaryColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        obscureText: true,
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password'),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            isLoading = true;
                            setState(() {});
                            await logInMethod();
                            SnakBarMethod(context, 'Success');
                            Navigator.pushNamed(
                                context, ChatPage.id, arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'User-not-found') {
                              SnakBarMethod(context, 'user not found');
                            } else if (e.code == 'wrong-password') {
                              SnakBarMethod(context, 'wrong password');
                            }
                          } catch (e) {
                            SnakBarMethod(context, 'there was an error');
                          }
                          isLoading = false;
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
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text(
                            'Resgester',
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

  void SnakBarMethod(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }

  Future<void> logInMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email!,
        password: password!
    );
  }


  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(
            animationController);
    slidingAnimation.addListener(() {
      setState(() {

      });
    });
    animationController.forward();
  }
}