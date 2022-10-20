import 'package:cjays/constants/colors.dart';
import 'package:cjays/widgets/project_dimensions.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  final String labelText, hintText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ProjectDimensions.heightTen * 2.5,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: ProjectColors.kBlackColor,
          ),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ProjectColors.kPrimaryColor),
            gapPadding: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10,
          ),
        ),
      ),
    );
  }
}
