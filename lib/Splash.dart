import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vanilla_app/intro.dart';
import 'package:vanilla_app/Authentication/signup.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1
      ({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset(
            'yui.json'
        ),

      ),
      // nextScreen:  MyIntro(),
      nextScreen: Login(),
      // duration: 3000,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      splashIconSize: 500,
    );
  }
}