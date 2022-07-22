import 'package:cjays/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        // SvgPicture.asset(
        //   ProjectIcons.errorIcon,
        //   height: getProportionateScreenWidth(14),
        //   width: getProportionateScreenWidth(14),
        // ),
        Icon(
          Icons.error,
          size: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(
          error,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(12),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
