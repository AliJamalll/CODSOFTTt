import 'package:chatapp/pages/register_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_Text_field.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              CustomTextField(hintText: 'Email',),
              SizedBox(
                height: 20,
              ),
              CustomTextField(hintText: 'Password'),
              SizedBox(
                height: 20,
              ),
              CustomButton(text: 'LOGIN',),
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
    );
  }
}
