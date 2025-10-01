import 'package:evently/features/main_layout/home_screen.dart';
import 'package:evently/features/authentication/forget_password_screen/forget_password_screen.dart';
import 'package:evently/features/authentication/login_screen/login_screen.dart';
import 'package:evently/features/authentication/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgetPasswordScreen = '/forget-password';
  static const String homeScreen = '/home';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
