import 'package:cjays/constants/colors.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: ProjectColors.kPrimaryColor,
    );
  }
}
