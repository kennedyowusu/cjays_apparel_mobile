import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

  CompleteProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
