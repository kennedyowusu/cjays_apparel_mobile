import 'package:flutter/material.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  // ignore:
  ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ForgetPasswordBody(),
      ),
    );
  }
}
