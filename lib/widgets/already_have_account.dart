import 'package:cjays/constants/colors.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
    required this.text,
    required this.subText,
    required this.onPressed,
  });

  final String text, subText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MediumText(
          text: text,
          color: ProjectColors.kBlackColor,
        ),
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: MediumText(
            text: subText,
            color: ProjectColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
