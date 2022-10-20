import 'package:cjays/views/auth/complete_profile/complete_profile_screen.dart';
import 'package:cjays/views/auth/forgot_password/forgot_password_screen.dart';
import 'package:cjays/views/auth/sign_success/login_success_screen.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/views/auth/signup/sign_up_screen.dart';
import 'package:cjays/views/cart_history/cart_history.dart';
import 'package:cjays/views/new_arrival/new_arrival.dart';
import 'package:cjays/views/otp/otp_screen.dart';
import 'package:cjays/views/profile/profile_screen.dart';
import 'package:cjays/views/shop/shop.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  // HomeScreen.routeName: (context) => HomeScreen(),
  // CartScreen.routeName: (context) => CartScreen(),
  ShopScreen.routeName: (context) => ShopScreen(),
  NewArrivalScreen.routeName: (context) => NewArrivalScreen(),
  CartHistoryScreen.routeName: (context) => CartHistoryScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
