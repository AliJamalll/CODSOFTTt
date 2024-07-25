import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_screen.dart';
import 'package:chatapp/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {/// to connect the string with it's value
        SplashScreen.id : (context) => SplashScreen(),
        LogInPage.id : (context) => LogInPage(),
        RegisterScreen.id : (context) => RegisterScreen(),
        ChatPage.id : (context) => ChatPage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "SplashScreen",//"LogInPage",
    );
  }
}

