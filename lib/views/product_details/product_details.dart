// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/models/Product.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cjays/constants/colors.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/widgets/expanded_text.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/project_icons.dart';
import 'package:cjays/widgets/small_text.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int screenId;

  ProductDetailsScreen({
    Key? key,
    required this.screenId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Product productData = Get.find<ProductController>().productList[screenId];

    Get.find<ProductController>().initProduct(
      productData,
      Get.find<CartController>(),
    );

    debugPrint('Screen id: $screenId');
    debugPrint('Product Name: ${productData.name}');

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ProjectColors.kPrimaryColor,
                  image: DecorationImage(
                    image: NetworkImage(ProjectConstants.BASE_URL +
                        ProjectConstants.UPLOAD_URL +
                        productData.image!),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.025,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => HomeScreen());
                    },
                    child: ProjectIcon(
                      icon: Icons.chevron_left_sharp,
                      color: ProjectColors.kWhiteColor,
                    ),
                  ),
                  GetBuilder<ProductController>(
                    builder: (productController) {
                      return Stack(
                        children: [
                          ProjectIcon(
                            icon: Icons.shopping_bag_outlined,
                            color: ProjectColors.kWhiteColor,
                          ),
                          Get.find<ProductController>().totalItems >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: ProjectIcon(
                                    icon: Icons.circle,
                                    size: 20.0,
                                    color: Colors.transparent,
                                    backgroundColor: ProjectColors.kWhiteColor,
                                  ),
                                )
                              : Container(),
                          Get.find<ProductController>().totalItems >= 1
                              ? Positioned(
                                  top: 3,
                                  right: 7,
                                  child: SmallText(
                                    text: Get.find<ProductController>()
                                        .totalItems
                                        .toString(),
                                    color: ProjectColors.kPrimaryColor,
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: height * 0.4,
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  color: ProjectColors.kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    MediumText(
                      text: productData.name!,
                      color: ProjectColors.kBlackColor,
                      size: 20.0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MediumText(
                      text: "Product Description",
                      size: 15,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                          text: productData.description!,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<ProductController>(
          builder: (productController) {
            return Container(
              height: height * 0.125,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
                bottom: 30.0,
              ),
              decoration: BoxDecoration(
                color: ProjectColors.kBlackColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height * 0.08,
                    width: width * 0.26,
                    decoration: BoxDecoration(
                      color: ProjectColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: ProjectColors.kPrimaryColor,
                          radius: 10.0,
                          child: GestureDetector(
                            onTap: () {
                              productController.setQuantity(false);
                            },
                            child: Icon(
                              Icons.remove,
                              color: ProjectColors.kWhiteColor,
                              size: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        MediumText(
                          text: productController.inCartItems.toString(),
                          size: 15,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: ProjectColors.kPrimaryColor,
                          radius: 10.0,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                productController.setQuantity(true);
                              },
                              child: Icon(
                                Icons.add,
                                color: ProjectColors.kWhiteColor,
                                size: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        productController.addItem(productData);
                      },
                      child: Container(
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          color: ProjectColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: MediumText(
                            text: "GH₵ ${productData.price} | Add to Cart",
                            color: ProjectColors.kWhiteColor,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
