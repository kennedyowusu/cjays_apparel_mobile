import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/models/Cart.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:cjays/widgets/display_message.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/no_data_view.dart';
import 'package:cjays/widgets/project_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GetBuilder<CartController>(
          builder: (cartController) {
            List<CartModel> cartList = cartController.getItems;
            return cartController.getItems.isNotEmpty
                ? ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.01),
                        padding: EdgeInsets.all(10),
                        // height: height * 0.12,
                        height: ProjectDimensions.heightTwenty * 6.2,
                        decoration: BoxDecoration(
                          color: ProjectColors.kGreyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.2,
                              child: GestureDetector(
                                onTap: () {
                                  int productIndex =
                                      Get.find<ProductController>()
                                          .productList
                                          .indexOf(
                                            cartList[index].product,
                                          );

                                  if (productIndex >= 0) {
                                    Get.toNamed(
                                      RouteHelper.getProductDetailsScreenRoute(
                                          productIndex, 'cartscreen'),
                                    );
                                  } else {
                                    int recommendedIndex =
                                        Get.find<ProductController>()
                                            .productList
                                            .indexWhere((element) =>
                                                element.id ==
                                                cartList[index].product.id);

                                    if (recommendedIndex < 0) {
                                      debugPrint(
                                        "Product not found in recommended list",
                                      );
                                      showSnackBar(
                                        'Product History',
                                        'Product History is not available',
                                      );
                                    } else {
                                      Get.toNamed(
                                        RouteHelper.getRecommendedRoute(
                                            recommendedIndex, 'cartscreen'),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(10)),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        ProjectConstants.BASE_URL +
                                            ProjectConstants.UPLOAD_URL +
                                            cartController
                                                .getItems[index].image,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.030),
                            Expanded(
                              child: SizedBox(
                                height: height * 0.12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MediumText(
                                      text: cartController.getItems[index].name,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MediumText(
                                          text:
                                              "GH₵ ${cartController.getItems[index].price}",
                                          color:
                                              ProjectColors.kForestGreenColor,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: ProjectColors
                                                    .kVenetianRedColor,
                                                radius: 10.0,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      cartList[index].product,
                                                      -1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: ProjectColors
                                                        .kWhiteColor,
                                                    size: 15.0,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              CircleAvatar(
                                                radius: 12.0,
                                                backgroundColor:
                                                    ProjectColors.kWhiteColor,
                                                child: MediumText(
                                                  text:
                                                      "${cartList[index].quantity}",
                                                  color: ProjectColors
                                                      .kForestGreenColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: ProjectColors
                                                    .kVenetianRedColor,
                                                radius: 10.0,
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                        cartList[index].product,
                                                        1,
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: ProjectColors
                                                          .kWhiteColor,
                                                      size: 15.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(
                      child: NoDataView(
                        imagePath: ProjectImages.kNoDataImage,
                        message: "Sorry, You have no Product in your cart",
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
