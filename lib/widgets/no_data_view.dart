import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  const NoDataView(
      {super.key,
      required this.message,
      this.imagePath = ProjectImages.kNoDataImage});

  final String message, imagePath;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                imagePath,
                height: height * 0.5,
                width: width * 0.5,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ProjectColors.kPrimaryColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
