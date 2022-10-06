// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cjays/controllers/category_controller.dart';
import 'package:flutter/material.dart';

import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:get/get.dart';

class AllCategoryScreen extends StatelessWidget {
  int categoryId;

  AllCategoryScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // var category = Get.find<CategoryController>().categoryList[categoryId];

    debugPrint('AllCategoryScreen: categoryId: $categoryId');
    // debugPrint('Category Name: ${category.name}');

    return SafeArea(
      child: Scaffold(
        backgroundColor: ProjectColors.kWhiteColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            60.0 * kMultiplier * height,
          ),
          child: AppBar(
            title: Text(
              "Cjays Apparel".toUpperCase(),
              style: kTabBarItemFontStyle.copyWith(
                fontSize: 18.0 * kMultiplier * height,
                fontWeight: FontWeight.bold,
                color: ProjectColors.kBlackColor,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ProjectColors.kWhiteColor,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.monetization_on,
                  color: ProjectColors.kPrimaryColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: ProjectColors.kBlackColor,
                ),
                onPressed: () {},
              ),
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20.0,
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 20.0 * kMultiplier * height,
              crossAxisSpacing: 20.0 * kMultiplier * height,
            ),
            itemBuilder: ((context, index) {
              return Stack(
                children: [
                  Container(
                    height: 180,
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: ProjectColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(
                        10.0 * kMultiplier * height,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ProjectColors.kBlackColor.withOpacity(0.16),
                          offset: Offset(0, 3),
                          blurRadius: 6.0 * kMultiplier * height,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/dress.png",
                          height: 140.0 * kMultiplier * height,
                          width: 160.0 * kMultiplier * width,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0 * kMultiplier * width,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sleeveless Dress",
                                style: kTabBarItemFontStyle.copyWith(
                                  fontSize: 14.0 * kMultiplier * height,
                                  fontWeight: FontWeight.bold,
                                  color: ProjectColors.kBlackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    right: 0,
                    left: 90,
                    child: Container(
                      height: 30.0 * kMultiplier * height,
                      width: 30.0 * kMultiplier * width,
                      decoration: BoxDecoration(
                        color: ProjectColors.kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: ProjectColors.kWhiteColor,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
