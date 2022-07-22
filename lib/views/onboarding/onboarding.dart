import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/views/onboarding/components/body.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "/splash";

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ProjectColors.kWhiteColor,
        body: OnboardingScreenBody(),
      ),
    );
  }
}
