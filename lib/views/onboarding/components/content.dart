import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/text.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Padding(
          padding: SizeConfig.orientation == Orientation.portrait
              ? EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.0)
              : EdgeInsets.symmetric(vertical: SizeConfig.screenWidth * 0.03),
          child: Text(
            ProjectText.kAppName.toUpperCase(),
            style: TextStyle(
              fontSize: SizeConfig.orientation == Orientation.portrait
                  ? getProportionateScreenWidth(20)
                  : getProportionateScreenWidth(12),
              color: ProjectColors.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.orientation == Orientation.portrait
                ? getProportionateScreenWidth(14)
                : getProportionateScreenWidth(10),
            color: ProjectColors.kBlackColor,
          ),
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: SizeConfig.orientation == Orientation.portrait
              ? getProportionateScreenHeight(256)
              : getProportionateScreenHeight(220),
          width: SizeConfig.orientation == Orientation.portrait
              ? getProportionateScreenWidth(235)
              : getProportionateScreenWidth(250),
        ),
      ],
    );
  }
}
