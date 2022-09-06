import 'package:cjays/constants/colors.dart';
import 'package:flutter/material.dart';

class ColorsAllDresses extends StatelessWidget {
  const ColorsAllDresses({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: height * 0.015,
          backgroundColor: ProjectColors.kPrimaryColor,
        ),
        SizedBox(
          width: width * 0.015,
        ),
        CircleAvatar(
          radius: height * 0.015,
          backgroundColor: ProjectColors.kBlackColor,
        ),
        SizedBox(
          width: width * 0.015,
        ),
        CircleAvatar(
          radius: height * 0.015,
          backgroundColor: ProjectColors.kSecondaryColor,
        ),
        SizedBox(
          width: width * 0.015,
        ),
        CircleAvatar(
          radius: height * 0.015,
          backgroundColor: ProjectColors.kGreyColor,
        ),
      ],
    );
  }
}
