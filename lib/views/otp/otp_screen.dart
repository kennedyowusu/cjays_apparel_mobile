import 'package:cjays/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  OtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: OTPScreenBody(),
      ),
    );
  }
}
