import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerRecommendedProducts extends StatelessWidget {
  const OwnerRecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: GetBuilder<ProductController>(
        builder: (productController) {
          return GridView.builder(
            itemCount: productController.productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.0,
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Image.network(
                            ProjectConstants.BASE_URL +
                                ProjectConstants.UPLOAD_URL +
                                productController.productList[index].image!,
                            height: height * 0.2,
                            width: width * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            productController.productList[index].name!,
                            style: kTabBarItemFontStyle.copyWith(
                              fontSize: 12.0 * kMultiplier * height,
                              fontWeight: FontWeight.bold,
                              color: ProjectColors.kBlackColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
