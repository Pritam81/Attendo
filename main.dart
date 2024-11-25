// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dashboard.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "",
  //       authDomain: "",
  //       projectId: "",
  //       storageBucket: "",
  //       messagingSenderId: "",
  //       appId: "",
  //       measurementId: "",
  //     ),
  //   );
  // } else {
  await Firebase.initializeApp();
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mysplashscreen(),
    );
  }
}

class mysplashscreen extends StatefulWidget {
  const mysplashscreen({super.key});

  @override
  State<mysplashscreen> createState() => _mysplashscreenState();
}

class _mysplashscreenState extends State<mysplashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const dashboard(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/iamattendo.png'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text("Designed And Developed By Pritam STP",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 255, 193, 7),
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ));
  }
}
