import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'dart:ffi';

void main()async{ WidgetsFlutterBinding.ensureInitialized();//step 1 in creating firebase and also see the docs to add it correctlly
  await Firebase.initializeApp(//this code is copied from docs
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SchoolChat());
}

class SchoolChat extends StatelessWidget {
  const SchoolChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
         LoginPage.id :(context) => const LoginPage()
        ,RegisterPage.id:(context)=>const RegisterPage()//create route step 3 or 1
        ,ChatPage.id:(context)=>ChatPage()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginPage' //when i used named routes i changed home to initialroute
    );
  }
}
//if i want to run on two emulators see vidieo 288 fixing chatting