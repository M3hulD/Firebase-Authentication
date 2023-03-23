import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cn_app/screens/auth_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset('assets/gdsc.png', height: 50,)
        ],
      ) ,
      backgroundColor: const Color(0xFF111111),
      splashIconSize: 200,
      nextScreen: AuthPage() ,
    );
  }
}