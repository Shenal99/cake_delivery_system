import '../home/home_screen.dart';

import '../auth/sign_in_screen.dart';
import '../auth/sign_up_screen.dart';

import '../app/splash_screen.dart';

import './app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
            title: 'My App',
            theme: AppTheme.themeData,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case SplashScreen.routeName:
                  return MaterialPageRoute(
                      builder: (context) => SplashScreen());

                case HomeScreen.routeName:
                  return MaterialPageRoute(builder: (context) => HomeScreen());

                case SignUpScreen.routeName:
                  return MaterialPageRoute(
                      builder: (context) => SignUpScreen());
                  case SignInScreen.routeName:
                  return MaterialPageRoute(
                      builder: (context) => SignInScreen());

                default:
                  return null;
              }
            }));
  }
}
