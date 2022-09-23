import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templates/common/widgets/error.dart';
import 'package:flutter_templates/features/auth/screen/login_screen.dart';
import 'package:flutter_templates/features/auth/screen/otp_screen.dart';
import 'package:flutter_templates/features/screens/screen/disasterscreen.dart';
import 'package:flutter_templates/features/screens/screen/donationscreen.dart';
import 'package:flutter_templates/features/screens/screen/homecrimescreen.dart';
import 'package:flutter_templates/features/screens/screen/notificationscreen.dart';
import 'package:flutter_templates/features/screens/screen/profilescreen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case HomeCrimeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeCrimeScreen());
    case DisasterScreen.routeName:
      return MaterialPageRoute(builder: (context) => const DisasterScreen());
    case NotificationScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const NotificationScreen());
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    case DonationScreen.routeName:
      return MaterialPageRoute(builder: (context) => const DonationScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
