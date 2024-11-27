import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import 'package:techdome/bottom_nav.dart';
import 'package:techdome/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    });

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image-removebg-preview (1).png',
              height: 90,
              width: 200,
            ),
           const CustomLoadingAnimation()
          ],
        ),
      ),
    );
  }
}
class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.white,
      size: 30,
    );
  }
}