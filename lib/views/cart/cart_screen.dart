import 'package:cjays/constants/colors.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/widgets/project_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/cart_body.dart';
import 'components/check_out_card.dart';

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
        bottomNavigationBar: CheckoutCard(),
      ),
    );
  }
}
