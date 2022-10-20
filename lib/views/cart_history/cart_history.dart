import 'dart:convert';

import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/enums.dart';
import 'package:cjays/models/Cart.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:cjays/widgets/custom_bottom_nav_bar.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/no_data_view.dart';
import 'package:cjays/widgets/project_dimensions.dart';
import 'package:cjays/widgets/project_icons.dart';
import 'package:cjays/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistoryScreen extends StatelessWidget {
  const CartHistoryScreen({Key? key}) : super(key: key);

  static const routeName = '/bag';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<CartModel> getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();

      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(
          getCartHistoryList[listCounter].time,
        );

        var inputDate = DateTime.parse(parseDate.toString());

        DateFormat outputFormat = DateFormat('MM/dd/yyyy hh:mm a');

        outputDate = outputFormat.format(inputDate);
      }

      return MediumText(
        text: outputDate,
      );
    }

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
              "CART HISTORY".toUpperCase(),
              style: kTabBarItemFontStyle.copyWith(
                fontSize: 20.0 * kMultiplier * height,
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
                icon: ProjectIcon(
                  icon: Icons.shopping_bag_outlined,
                  color: ProjectColors.kWhiteColor,
                ),
                onPressed: () {},
              ),
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.79,
                // height: ProjectDimensions.heightTen * 60,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(
                  horizontal: 20.0 * kMultiplier * width,
                  vertical: 10.0 * kMultiplier * height,
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: [
                      for (int i = 0; i < itemsPerOrder.length; i++)
                        Container(
                          height: 140.0 * kMultiplier * height,
                          margin: EdgeInsets.only(
                            bottom: 10.0 * kMultiplier * height,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ProjectColors.kGreyColor,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  top: 2.0,
                                  bottom: 2.0,
                                  right: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    timeWidget(listCounter),
                                    MediumText(
                                      text: "Order No. ${i + 1}",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0 * kMultiplier * height,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(
                                      itemsPerOrder[i],
                                      (index) {
                                        if (listCounter <
                                            getCartHistoryList.length) {
                                          listCounter++;
                                        }
                                        return index <= 2
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                ),
                                                child: Container(
                                                  height: 100.0 *
                                                      kMultiplier *
                                                      height,
                                                  width: 160.0 *
                                                      kMultiplier *
                                                      width,
                                                  margin: EdgeInsets.only(
                                                    right: 0.0 *
                                                        kMultiplier *
                                                        width,
                                                    left: index == 0
                                                        ? 0.0
                                                        : 2.0 *
                                                            kMultiplier *
                                                            width,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      8.0 *
                                                          kMultiplier *
                                                          height,
                                                    ),
                                                    border: Border.all(
                                                      color: ProjectColors
                                                          .kGreyColor,
                                                      width: 1.0 *
                                                          kMultiplier *
                                                          height,
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        ProjectConstants
                                                                .BASE_URL +
                                                            ProjectConstants
                                                                .UPLOAD_URL +
                                                            getCartHistoryList[
                                                                    listCounter -
                                                                        1]
                                                                .image,
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100.0 * kMultiplier * height,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 5.0 * kMultiplier * height,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right:
                                                    10.0 * kMultiplier * height,
                                              ),
                                              child: MediumText(
                                                text: itemsPerOrder[i] == 1
                                                    ? '1 Item'
                                                    : '${itemsPerOrder[i]} Items',
                                                color:
                                                    ProjectColors.kBlackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            List<String> orderTime =
                                                cartOrderTimeToList();

                                            Map<int, CartModel> moreOrder = {};

                                            for (int j = 0;
                                                j < getCartHistoryList.length;
                                                j++) {
                                              if (getCartHistoryList[j].time ==
                                                  orderTime[i]) {
                                                moreOrder.putIfAbsent(
                                                  getCartHistoryList[j].id,
                                                  () {
                                                    return CartModel.fromJson(
                                                      jsonDecode(
                                                        jsonEncode(
                                                          getCartHistoryList[j],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            }
                                            Get.find<CartController>()
                                                .setItems = moreOrder;

                                            Get.find<CartController>()
                                                .addToCartList();

                                            Get.toNamed(
                                              RouteHelper.getCartScreen(),
                                            );
                                          },
                                          child: Container(
                                            height: 40.0 * kMultiplier * height,
                                            width: 200.0 * kMultiplier * width,
                                            margin: EdgeInsets.only(
                                              right:
                                                  10.0 * kMultiplier * height,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  ProjectDimensions.widthTen,
                                              vertical:
                                                  ProjectDimensions.heightTen /
                                                      5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ProjectColors.kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                4.0 * kMultiplier * height,
                                              ),
                                              border: Border.all(
                                                color: ProjectColors.kGreyColor,
                                              ),
                                            ),
                                            child: Center(
                                              child: MediumText(
                                                text: "View More",
                                                size: ProjectDimensions
                                                    .textSizeTwelve,
                                                color:
                                                    ProjectColors.kPrimaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.bag),
      ),
    );
  }
}
