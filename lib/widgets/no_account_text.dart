import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoAccountText extends StatelessWidget {
  NoAccountText({
    Key? key,
    required this.text,
    required this.actionText,
    required this.onTap,
  }) : super(key: key);

  String text, actionText = "";
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => onTap(),
          child: Text(
            actionText,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
