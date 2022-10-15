import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:cjays/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerRecommendedProducts extends StatelessWidget {
  const OwnerRecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // productController.productList[index].isRecommended == true

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: GetBuilder<ProductController>(
        builder: (productController) {
          return SingleChildScrollView(
            child: productController.isLoaded
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productController.productList.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: height * 0.0,
                    ),
                    itemBuilder: (c, i) {
                      return productController.productList[i].isRecommended ==
                              true
                          ? Stack(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height: height * 0.38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.maxFinite,
                                        height: height * 0.30,
                                        decoration: BoxDecoration(
                                          color: ProjectColors.kGreyColor
                                              .withOpacity(0.4),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              ProjectConstants.BASE_URL +
                                                  ProjectConstants.UPLOAD_URL +
                                                  productController
                                                      .productList[i].image!,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Container(
                                        width: double.maxFinite,
                                        height: height * 0.04,
                                        color: ProjectColors.kGreyColor
                                            .withOpacity(0.4),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.02,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween, //Center Row contents horizontally,
                                          children: [
                                            Text(
                                              productController
                                                  .productList[i].name!,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color:
                                                    ProjectColors.kBlackColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "GHS ${productController.productList[i].price!}",
                                              style: TextStyle(
                                                color: ProjectColors
                                                    .kForestGreenColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: height * 0.01,
                                  right: width * 0.01,
                                  child: GestureDetector(
                                    onTap: () {
                                      debugPrint(productController
                                          .productList[i].id
                                          .toString());
                                    },
                                    child: Container(
                                      width: width * 0.10,
                                      height: height * 0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  ProjectColors.kPrimaryColor,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons
                                                .keyboard_double_arrow_right_sharp,
                                            color: ProjectColors.kPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox();
                    },
                  )
                : Center(
                    child: Loader(),
                  ),
          );
        },
      ),
    );
  }
}

// if (productController
//                             .productList[index].isRecommended!) {}
