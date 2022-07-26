import 'package:cjays/constants/styles.dart';
import 'package:flutter/material.dart';

class SecondHeaderContent extends StatelessWidget {
  const SecondHeaderContent({
    Key? key,
    required this.height,
    required this.width,
    required this.day,
    required this.total,
    required this.text,
    required this.color,
  }) : super(key: key);

  final double height;
  final double width;
  final String day, total, text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.12,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: kTabBarItemFontStyle.copyWith(
              fontSize: 12.0 * kMultiplier * height,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            total,
            style: kTabBarItemFontStyle.copyWith(
              fontSize: 12.0 * kMultiplier * height,
              color: color,
            ),
          ),
          Text(
            text,
            style: kTabBarItemFontStyle.copyWith(
              fontSize: 12.0 * kMultiplier * height,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
