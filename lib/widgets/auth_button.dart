import 'package:cjays/constants/colors.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/project_dimensions.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  });

  final double width, height;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ProjectDimensions.heightTen * 2.5,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColors.kPrimaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(width, height * 0.06),
          // maximumSize: Size(width * 0.8, height * 0.06),
        ),
        onPressed: () {
          onPressed;
        },
        child: MediumText(
          text: text,
          color: ProjectColors.kWhiteColor,
        ),
      ),
    );
  }
}
