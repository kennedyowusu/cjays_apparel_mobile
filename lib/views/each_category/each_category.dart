import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/product_category_controller.dart';
import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/models/category.dart';
import 'package:cjays/models/product_category.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/product_category_repo.dart';

class EachCategoryScreen extends StatelessWidget {
  EachCategoryScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final productCategoryController = Get.put(ProductCategoryController(
      category: category,
    ));

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
              category.name.toString().toUpperCase(),
              style: kTabBarItemFontStyle.copyWith(
                fontSize: 18.0 * kMultiplier * height,
                fontWeight: FontWeight.bold,
                color: ProjectColors.kBlackColor,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.chevron_left,
                color: ProjectColors.kBlackColor,
              ),
            ),
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
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Obx(
            () => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: productCategoryController.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                ProductsCategory product =
                    productCategoryController.categoryList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.0,
                    vertical: 0.0,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.3,
                        margin: EdgeInsets.only(
                          bottom: height * 0.04,
                        ),
                        decoration: BoxDecoration(
                          color: ProjectColors.kGreyColor.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              ProjectConstants.BASE_URL +
                                  ProjectConstants.UPLOAD_URL +
                                  product.image!,
                            ),
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: height * 0.03,
                          width: double.infinity,
                          color: ProjectColors.kBlackColor.withOpacity(0.7),
                          child: Center(
                            child: Text(
                              product.name.toString(),
                              style: kTabBarItemFontStyle.copyWith(
                                fontSize: 12.0 * kMultiplier * height,
                                fontWeight: FontWeight.bold,
                                color: ProjectColors.kWhiteColor,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
