import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/controllers/auth/auth_controller.dart';
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/no_data_view.dart';
import 'package:cjays/widgets/project_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/cart_body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: ProjectIcon(
                      icon: Icons.chevron_left_sharp,
                      color: ProjectColors.kWhiteColor,
                      backgroundColor: ProjectColors.kVenetianRedColor,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(RouteHelper.home);
                    },
                    icon: ProjectIcon(
                      icon: Icons.home_outlined,
                      color: ProjectColors.kWhiteColor,
                      backgroundColor: ProjectColors.kVenetianRedColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: ProjectIcon(
                      icon: Icons.shopping_bag_outlined,
                      color: ProjectColors.kWhiteColor,
                      backgroundColor: ProjectColors.kVenetianRedColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height * 0.09,
              left: width * 0.05,
              right: width * 0.05,
              bottom: 0,
              child: SizedBox(
                child: CartBody(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) {
            return cartController.getItems.isNotEmpty
                ? Container(
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
                          width: width * 0.40,
                          decoration: BoxDecoration(
                            color: ProjectColors.kWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20.0,
                              ),
                              MediumText(
                                text: "GH₵ ${cartController.totalAmount}",
                                size: 15,
                              ),
                              SizedBox(
                                width: 20,
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
                              if (Get.find<AuthenticationController>()
                                  .isUserLoggedIn()) {
                                cartController.addToHistory();
                              } else {
                                Get.toNamed(RouteHelper.getLoginScreen());
                              }
                            },
                            child: Container(
                              height: height * 0.08,
                              decoration: BoxDecoration(
                                color: ProjectColors.kVenetianRedColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: MediumText(
                                  text: "Checkout",
                                  color: ProjectColors.kWhiteColor,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox();
          },
        ),
      ),
    );
  }
}
