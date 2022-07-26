import 'package:cjays/constants/colors.dart';
import 'package:flutter/material.dart';

class SecondHeader extends StatelessWidget {
  const SecondHeader({
    Key? key,
    required this.height,
    required this.title,
    required this.icon,
    this.subtitle,
  }) : super(key: key);

  final double height;
  final String title;
  final String? subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: height * 0.028,
          left: height * 0.041,
          child: Center(
            child: Text(
              subtitle ?? '',
              style: TextStyle(
                fontSize: height * 0.012,
                color: ProjectColors.kBlackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              // size: height * 0.040,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: height * 0.015,
                color: ProjectColors.kBlackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
