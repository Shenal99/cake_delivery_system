import 'package:cakeapp/auth/sign_in_screen.dart';
import 'package:cakeapp/home/home_screen.dart';

import '../auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../app/splash_screen.dart';


class AppRouter {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String uiTestScreenRoute = '/uiTest';
  static const String socialLoginScreenRoute = '/sociallogin';
  static const String emailVerifyScreenRoute = '/emailverify';
  static const String signupScreenRoute = '/signup';
  static const String signinScreenRoute = '/signin';
  static const String otpLoginRoute = '/otp-login';
  static const String profileRoute = '/profile';
  static const String editProfileRoute = '/edit-profile';
  static const String chatRoute = '/chat';
  static const String savedPageRoute = '/savedpage';
  static const String mybillScreenRoute = '/mybillscreen';
  static const String historyScreenRoute = '/historyscreen';
  static const String moreScreenRoute = '/morescreen';
  static const String inviteFriendsScreenRoute = '/invitescreen';
  static const String bottomNaviagtion = '/bottomnavigation';
  static const String notificationScreenRoute = '/notifications';
  static const String couponsScreenRoute = '/coupons';
  static const String searchScreenRoute = '/search';
  static const String notificationDetailScreenRoute = '/notificationdetail';
  static const String aboutScreenRoute = '/about';
  static const String termsnconditionScreenRoute = '/termsncondition';
  static const String privacyScreenRoute = '/privacy';
  static const String myOrderScreenRoute = '/myorderscreen';
  static const String orderCompleteScreenRoute = '/ordercompletescreen';
  static const String restuarentDetailScreenRoute = '/restuarantdetail';
  static const String exploreScreenRoute = '/explorescreen';
  static const String detailhistoryScreenRoute = '/detailhistoryscreen';
  static const String learnScreenRoute = '/learn';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
 case signupScreenRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
 case signinScreenRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());




      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
