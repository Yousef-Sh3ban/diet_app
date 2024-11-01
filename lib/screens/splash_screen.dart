import 'dart:async';

import 'package:diet_planner/configuration/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../configuration/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // to navigate to the home screen after 10 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
    // to animate the logo
    timer = Timer.periodic(
      const Duration(seconds: 1),//the time he wait to start change the width
      (timer) {
        if (width == 130) {
          setState(() {
            width = 150;
            height = 180;
          });
        } else {
          setState(() {
            width = 130;
            height = 154;
          });
        }
      },
    );
    super.initState();
  }

  double width = 130;
  double height = 154;
  late Timer timer;
  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Center(
          child: AnimatedContainer(
            width: width,
            height: height,
            duration: const Duration(seconds:1),//the time of the amimation to go to new state
            child: Image.asset(
              "assets/images/app_logo.png",
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 85,
          child: Center(
            child: Text(
              "Richdiets 2023",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    ),);
  }


}
