import 'dart:async';

import 'package:driver_dxb/view/screens/welcome_sceen/screen_welcome.dart';
import 'package:flutter/material.dart';
import 'package:driver_dxb/utils/constants.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ScreenWelcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Image.asset('assets/images/splash_image_full.png'),
      ),
    );
  }
}
