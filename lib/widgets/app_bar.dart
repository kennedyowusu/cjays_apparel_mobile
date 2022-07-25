import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
    required this.actions,
    required this.automaticallyImplyLeading,
    required this.elevation,
    required this.backgroundColor,
    required this.centerTitle,
    required this.title,
    required this.height,
  }) : super(key: key);

  final double height;
  final List<IconButton> actions;
  final bool automaticallyImplyLeading;
  final double elevation;
  final Color backgroundColor;
  final bool centerTitle;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: ProjectColors.kWhiteColor,
      centerTitle: true,
      title: title,
      actions: [
        IconButton(
          icon: Icon(
            Icons.monetization_on,
            color: ProjectColors.kPrimaryColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon:
              Icon(Icons.notifications_none, color: ProjectColors.kBlackColor),
          onPressed: () {},
        ),
      ],
      height: height,
    );
  }
}
