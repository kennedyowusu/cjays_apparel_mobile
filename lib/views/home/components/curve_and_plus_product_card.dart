import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/home.dart/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurveAndPlusProductCard extends StatelessWidget {
  CurveAndPlusProductCard({
    Key? key,
    required this.height,
    required this.width,
    required this.percentage,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.image,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final double height;
  final double width;
  final String percentage, oldPrice, newPrice, image;
  String title = "";
  final Color color;
  final IconData icon;

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.025,
        ),
        Stack(
          children: [
            Container(
              height: height * 0.40,
              width: width * 0.43,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.02,
              left: width * 0.02,
              top: height * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.04,
                    width: width * 0.11,
                    color: ProjectColors.kVenetianRedColor,
                    child: Center(
                      child: Text(
                        percentage,
                        style: kTabBarItemFontStyle.copyWith(
                          color: ProjectColors.kWhiteColor,
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.2,
                  ),
                  GestureDetector(
                    onTap: () {
                      homeController.toggleFavorite();
                    },
                    child: CircleAvatar(
                      radius: height * 0.022,
                      backgroundColor: ProjectColors.kWhiteColor,
                      child: Icon(
                        icon,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height * 0.36,
              child: Container(
                height: height * 0.04,
                width: width * 0.43,
                color: ProjectColors.kWhiteColor.withOpacity(0.7),
                child: Center(
                  child: Text(
                    title,
                    style: kTabBarItemFontStyle.copyWith(
                      color: ProjectColors.kBlackColor,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: RichText(
            textScaleFactor: 1.1,
            text: TextSpan(
              text: newPrice,
              style: kTabBarItemFontStyle.copyWith(
                color: ProjectColors.kForestGreenColor,
                fontSize: height * 0.02,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: oldPrice,
                  style: kTabBarItemFontStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: ProjectColors.kVenetianRedColor.withOpacity(0.3),
                    fontSize: height * 0.02,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
