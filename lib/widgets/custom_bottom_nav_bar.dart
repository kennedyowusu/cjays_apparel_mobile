import 'package:cjays/constants/colors.dart';
import 'package:cjays/enums.dart';
import 'package:cjays/views/cart_history/cart_history.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/new_arrival/new_arrival.dart';
import 'package:cjays/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: ProjectColors.kWhiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                size: 30.0,
                color: MenuState.home == selectedMenu
                    ? ProjectColors.kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Get.to(() => HomeScreen()),
              // Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.shop_outlined,
            //     size: 30.0,
            //     color: MenuState.shop == selectedMenu
            //         ? ProjectColors.kBlackColor
            //         : inActiveIconColor,
            //   ),
            //   onPressed: () => Get.to(() => ShopScreen()),
            //   // Navigator.pushNamed(context, ShopScreen.routeName),
            // ),
            IconButton(
              icon: Icon(
                Icons.new_label_outlined,
                size: 30.0,
                color: MenuState.arrival == selectedMenu
                    ? ProjectColors.kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Get.to(() => NewArrivalScreen()),
              // Navigator.pushNamed(context, NewArrivalScreen.routeName),
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 30.0,
                color: MenuState.bag == selectedMenu
                    ? ProjectColors.kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Get.to(() => CartHistoryScreen()),
              // Navigator.pushNamed(context, BagScreen.routeName),
            ),
            IconButton(
              icon: Icon(
                Icons.person_outline,
                color: MenuState.profile == selectedMenu
                    ? ProjectColors.kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Get.to(() => ProfileScreen()),
              // Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
