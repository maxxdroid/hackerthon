import 'package:flutter/material.dart';
import 'package:hackathon/screens/loading_screen.dart';
import './auth/sign_in.dart';
// import 'package:hackathon/homewidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackerthon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "signIn" : (context) => const SignIn()
      },
      home: const LoadingPage(),
      // home: const HomeWidget(),
    );
  }
}
