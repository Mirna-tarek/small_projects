import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/widgets/splash_widget.dart';

import 'onboarding_view_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: buildSplashWidget(),
        splashIconSize: double.infinity,
        nextScreen: OnBoardingViewBody(), // Set OnBoardingViewBody as the home screen after splash
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
      ),
    );
  }
}