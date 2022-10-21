import 'package:flutter/material.dart';

import 'components/sign_up_body.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RegisterBody(),
      ),
    );
  }
}
