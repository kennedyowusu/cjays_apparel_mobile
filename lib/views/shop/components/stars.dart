import 'package:cjays/constants/colors.dart';
import 'package:flutter/material.dart';

class AllDressesStars extends StatelessWidget {
  const AllDressesStars({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: height * 0.020,
          color: ProjectColors.kPrimaryColor,
        ),
        Icon(
          Icons.star,
          size: height * 0.020,
          color: ProjectColors.kPrimaryColor,
        ),
        Icon(
          Icons.star,
          size: height * 0.020,
          color: ProjectColors.kPrimaryColor,
        ),
        Icon(
          Icons.star,
          size: height * 0.020,
          color: ProjectColors.kPrimaryColor,
        ),
        Icon(
          Icons.star_half,
          size: height * 0.020,
          color: ProjectColors.kPrimaryColor,
        ),
      ],
    );
  }
}
