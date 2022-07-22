import 'package:cjays/views/auth/signin/components/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
