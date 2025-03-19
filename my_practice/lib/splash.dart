import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_practice/home_veshack.dart';
import 'package:my_practice/intro.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1
({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
            child:Lottie.asset('assets/animations/Animation.json')

        // Lottie.asset(
            //   'assets/animations/Animation_1740811539224.json'
            // ),

      ),
      nextScreen:  MyIntro(),
    duration: 6000,
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    splashIconSize: 500,
    );
  }
}