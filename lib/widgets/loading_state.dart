import 'package:cjays/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: ProjectColors.kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minimumSize: Size(width * 0.8, 50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text!,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SpinKitCircle(
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
    );
  }
}
