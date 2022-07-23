import 'package:cjays/views/auth/complete_profile/complete_profile_screen.dart';
import 'package:cjays/views/auth/forgot_password/forgot_password_screen.dart';
import 'package:cjays/views/auth/sign_success/login_success_screen.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/views/auth/signup/sign_up_screen.dart';
import 'package:cjays/views/cart/cart_screen.dart';
import 'package:cjays/views/details/details_screen.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/otp/otp_screen.dart';
import 'package:cjays/views/profile/profile_screen.dart';
import 'package:cjays/views/splash/splash.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
