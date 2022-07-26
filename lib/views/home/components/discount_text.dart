import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:flutter/material.dart';

class DiscountText extends StatelessWidget {
  const DiscountText({
    Key? key,
    required this.height,
    required this.text,
    required this.fontWeight,
    required this.size,
  }) : super(key: key);

  final double height;
  final String text;
  final FontWeight fontWeight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: kTabBarItemFontStyle.copyWith(
        fontSize: size,
        color: ProjectColors.kWhiteColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
