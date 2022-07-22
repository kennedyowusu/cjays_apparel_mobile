import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
