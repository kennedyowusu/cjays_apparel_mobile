import 'package:cjays/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: ProjectColors.kPrimaryColor,
        size: 40,
      ),
    );
  }
}
