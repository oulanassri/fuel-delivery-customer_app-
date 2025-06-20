import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../constants.dart';
import '../LogIn/login_screen.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Themes.BackgroundColor,
      body: Container(
        decoration: BoxDecoration(gradient: gradientColorBg),
        child: /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                Assets.imagesLogo,
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
            Text(
              "Fuel Go Customer",
              textAlign: TextAlign.center,
              style:
              TextStyle(letterSpacing: 3, fontSize: 26, color: Colors.grey),
            ),
          ],
        )*/
            Center(
          child: AnimatedSplashScreen(
            backgroundColor: Colors.transparent.withOpacity(0),
            animationDuration: const Duration(milliseconds: 2300),
            splashIconSize: 500,
            splashTransition: SplashTransition.scaleTransition,
            splash: Center(
              child: Image.asset(
                Assets.imagesLogo,
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
            nextScreen: const LogInScreen(),
          ),
        ),
      ),
    );
  }
}
