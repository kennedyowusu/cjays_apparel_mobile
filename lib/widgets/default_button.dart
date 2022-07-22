import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.orientation == Orientation.portrait
          ? getProportionateScreenHeight(56)
          : getProportionateScreenHeight(85),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: Colors.white,
          backgroundColor: ProjectColors.kPrimaryColor,
        ),
        onPressed: press as void Function()?,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: SizeConfig.orientation == Orientation.portrait
                  ? getProportionateScreenWidth(18)
                  : getProportionateScreenWidth(11),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
