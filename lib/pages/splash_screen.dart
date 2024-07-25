import 'package:chatapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Welcome',
                style: myStyle(
                  size: 80,
                  weight: FontWeight.bold
                )
              ),
              Text(
                  'we’re glad that that\n you are here',
                  style: myStyle(
                      size: 35,
                      weight: FontWeight.normal
                  ),
              ),
              Lottie.asset('assets/images/Animation - 1720601821569.json'),
              Spacer(),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => LogInPage()
                  )
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 170),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KPrimaryColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Start',
                      style: myStyle(
                        color: Colors.white,
                        weight: FontWeight.bold,
                        size: 15
                      ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
