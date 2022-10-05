import 'package:cjays/constants/colors.dart';
import 'package:flutter/material.dart';

class ProjectIcon extends StatelessWidget {
  const ProjectIcon({
    super.key,
    required this.icon,
    this.color = Colors.white,
    this.backgroundColor = ProjectColors.kVenetianRedColor,
    this.size = 35.0,
  });

  final IconData icon;
  final Color color, backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: size * 0.6,
        ),
      ),
    );
  }
}
