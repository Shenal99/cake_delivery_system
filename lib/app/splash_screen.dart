import 'dart:async';
import 'package:cakeapp/shared/colors.dart';
import 'package:flutter/material.dart';
import '../app/app_router.dart';
import '../shared/images.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      // Navigate to the social screen when the timer is up
      Navigator.pushNamed(context, AppRouter.signinScreenRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainButtonBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 200,
            image: logoImage,
            ),

          ],
        ),
      ),
    );
  }
}
