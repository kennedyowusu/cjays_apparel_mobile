import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/enums.dart';
import 'package:cjays/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
        body: Body(),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.profile),
      ),
    );
  }
}
