import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:flutter/material.dart';

class CurvesAndPlusIMenu extends StatelessWidget {
  const CurvesAndPlusIMenu({
    Key? key,
    required this.height,
    required this.text,
    required this.pressed,
  }) : super(key: key);

  final double height;
  final String text;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pressed,
      child: Text(
        text,
        style: kTabBarItemFontStyle.copyWith(
          fontSize: 16.0 * kMultiplier * height,
          fontWeight: FontWeight.bold,
          color: ProjectColors.kBlackColor.withOpacity(0.5),
        ),
      ),
    );
  }
}

class CurveAndPlusCard extends StatelessWidget {
  const CurveAndPlusCard({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.buttonText,
  }) : super(key: key);

  final double height;
  final double width;
  final String image, title, subtitle, text, buttonText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * 0.4,
          width: width * 0.43,
          decoration: BoxDecoration(
            color: ProjectColors.kGreyColor,
          ),
          child: Image.asset(
            image,
            height: height * 0.4,
            width: width * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: kTabBarItemFontStyle.copyWith(
                  fontSize: height * 0.02,
                  color: ProjectColors.kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: kTabBarItemFontStyle.copyWith(
                  fontSize: height * 0.03,
                  color: ProjectColors.kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text,
                style: kTabBarItemFontStyle.copyWith(
                  fontSize: height * 0.04,
                  color: ProjectColors.kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.028,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ProjectColors.kPrimaryColor,
                    minimumSize: Size(
                      width * 0.1,
                      height * 0.05,
                    ),
                    padding: EdgeInsets.all(
                      height * 0.01,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        height * 0.01,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        buttonText.toUpperCase(),
                        style: kTabBarItemFontStyle.copyWith(
                          fontSize: height * 0.018,
                          color: ProjectColors.kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: ProjectColors.kWhiteColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProductAndText extends StatelessWidget {
  const ProductAndText({
    Key? key,
    required this.height,
    required this.name,
    required this.image,
    required this.width,
  }) : super(key: key);

  final double height, width;
  final String name, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: height * 0.04,
              backgroundColor: ProjectColors.kGreyColor.withOpacity(0.5),
              child: Image.asset(
                image,
                height: height * 0.07,
                width: height * 0.07,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.004,
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: height * 0.016,
                color: ProjectColors.kBlackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
