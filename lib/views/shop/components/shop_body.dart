import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/home.dart/home.dart';
import 'package:cjays/views/home/components/curve_and_plus_product_card.dart';
import 'package:cjays/views/shop/components/all_dresses_colors.dart';
import 'package:cjays/views/shop/components/stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopBody extends StatelessWidget {
  ShopBody({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (c, i) {
        return Column(
          children: [
            SizedBox(
              height: height * 0.007,
            ),
            Container(
              height: height * 0.05,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ProjectColors.kWhiteColor,
                border: Border(
                  bottom: BorderSide(
                    color: ProjectColors.kBlackColor,
                    width: 0.5,
                  ),
                  top: BorderSide(
                    color: ProjectColors.kBlackColor,
                    width: 0.5,
                  ),
                ),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          'recommend'.toUpperCase(),
                          style: kTabBarItemFontStyle.copyWith(
                            fontSize: 14.0 * kMultiplier * height,
                            color: ProjectColors.kBlackColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Icon(
                          Icons.approval_outlined,
                          size: height * 0.022,
                          color: ProjectColors.kBlackColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: ProjectColors.kBlackColor,
                      thickness: 0.15,
                      indent: width * 0.005,
                      endIndent: width * 0.005,
                    ),
                    Row(
                      children: [
                        Text(
                          'FIlter'.toUpperCase(),
                          style: kTabBarItemFontStyle.copyWith(
                            fontSize: 14.0 * kMultiplier * height,
                            color: ProjectColors.kBlackColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Icon(
                          Icons.filter_alt_outlined,
                          size: height * 0.022,
                          color: ProjectColors.kBlackColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    CurveAndPlusProductCard(
                      height: height,
                      width: width,
                      percentage: "-40%",
                      oldPrice: " GHS 130 ",
                      newPrice: "GHS 99",
                      title: "Vacation Sale",
                      image: ProjectImages.kClothe,
                      color: homeController.isFavorite.value
                          ? ProjectColors.kVenetianRedColor
                          : ProjectColors.kBlackColor,
                      icon: homeController.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    AllDressesStars(height: height),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Container(
                      height: height * 0.03,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ProjectColors.kBlackColor,
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Quality Guaranteed',
                          style: kTabBarItemFontStyle.copyWith(
                            fontSize: 14.0 * kMultiplier * height,
                            color: ProjectColors.kForestGreenColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    ColorsAllDresses(
                      height: height,
                      width: width,
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.065,
                ),
                Column(
                  children: [
                    CurveAndPlusProductCard(
                      height: height,
                      width: width,
                      percentage: "-35%",
                      oldPrice: " GHS 180 ",
                      newPrice: "GHS 139",
                      title: "Vacation Sale",
                      image: ProjectImages.kOutfit_1,
                      color: homeController.isFavorite.value
                          ? ProjectColors.kVenetianRedColor
                          : ProjectColors.kBlackColor,
                      icon: homeController.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    AllDressesStars(height: height),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Container(
                      height: height * 0.03,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ProjectColors.kBlackColor,
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Quality Guaranteed',
                          style: kTabBarItemFontStyle.copyWith(
                            fontSize: 14.0 * kMultiplier * height,
                            color: ProjectColors.kForestGreenColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    ColorsAllDresses(
                      height: height,
                      width: width,
                      // color: ProjectColors.kBlackColor,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    CurveAndPlusProductCard(
                      height: height,
                      width: width,
                      percentage: "-27%",
                      oldPrice: " GHS 210 ",
                      newPrice: "GHS 179",
                      title: "Vacation Sale",
                      image: ProjectImages.kOutfit,
                      color: homeController.isFavorite.value
                          ? ProjectColors.kVenetianRedColor
                          : ProjectColors.kBlackColor,
                      icon: homeController.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    AllDressesStars(height: height),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Container(
                      height: height * 0.03,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ProjectColors.kBlackColor,
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Quality Guaranteed',
                          style: kTabBarItemFontStyle.copyWith(
                            fontSize: 14.0 * kMultiplier * height,
                            color: ProjectColors.kForestGreenColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    ColorsAllDresses(
                      height: height,
                      width: width,
                      // color: ProjectColors.kBlackColor,
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.065,
                ),
                Column(
                  children: [
                    CurveAndPlusProductCard(
                      height: height,
                      width: width,
                      percentage: "-30%",
                      oldPrice: " GHS 80 ",
                      newPrice: "GHS 59",
                      title: "Vacation Sale",
                      image: ProjectImages.kSleeveClothe,
                      color: homeController.isFavorite.value
                          ? ProjectColors.kVenetianRedColor
                          : ProjectColors.kBlackColor,
                      icon: homeController.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    AllDressesStars(height: height),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Container(
                      height: height * 0.03,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ProjectColors.kBlackColor,
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Quality Guaranteed',
                          style: kTabBarItemFontStyle.copyWith(
                            fontSize: 14.0 * kMultiplier * height,
                            color: ProjectColors.kForestGreenColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    ColorsAllDresses(
                      height: height,
                      width: width,
                      // color: ProjectColors.kBlackColor,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    CurveAndPlusProductCard(
                      height: height,
                      width: width,
                      percentage: "-25%",
                      oldPrice: " GHS 110 ",
                      newPrice: "GHS 89",
                      title: "Vacation Sale",
                      image: ProjectImages.kOutfit_3,
                      color: homeController.isFavorite.value
                          ? ProjectColors.kVenetianRedColor
                          : ProjectColors.kBlackColor,
                      icon: homeController.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    AllDressesStars(height: height),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Container(
                      height: height * 0.03,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ProjectColors.kBlackColor,
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Quality Guaranteed',
                          style: kTabBarItemFontStyle.copyWith(
                            fontSize: 14.0 * kMultiplier * height,
                            color: ProjectColors.kForestGreenColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    ColorsAllDresses(
                      height: height,
                      width: width,
                      // color: ProjectColors.kBlackColor,
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.065,
                ),
                Column(
                  children: [
                    CurveAndPlusProductCard(
                      height: height,
                      width: width,
                      percentage: "-45%",
                      oldPrice: " GHS 90 ",
                      newPrice: "GHS 69",
                      title: "Vacation Sale",
                      image: ProjectImages.kOutfit_2,
                      color: homeController.isFavorite.value
                          ? ProjectColors.kVenetianRedColor
                          : ProjectColors.kBlackColor,
                      icon: homeController.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    AllDressesStars(height: height),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Container(
                      height: height * 0.03,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ProjectColors.kBlackColor,
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Quality Guaranteed',
                          style: kTabBarItemFontStyle.copyWith(
                            fontSize: 14.0 * kMultiplier * height,
                            color: ProjectColors.kForestGreenColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    ColorsAllDresses(
                      height: height,
                      width: width,
                      // color: ProjectColors.kBlackColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.030,
            ),
          ],
        );
      },
    );
  }
}
