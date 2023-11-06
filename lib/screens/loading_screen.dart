import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  displaySplash() {
    Timer(const Duration(seconds: 4), () async {
      // if (AuthMethods().auth.currentUser != null) {
      //   Navigator.pushReplacementNamed(context, "home");
      //   id = AuthMethods().auth.currentUser!.uid;
      //   // print("...............................$id");
      // } else {
        Navigator.pushReplacementNamed(context, "signIn");
      // }
    });
  }


  @override
  void initState() {
    super.initState();
    displaySplash();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.blue, size: 100,),
      ),
    );
  }
}