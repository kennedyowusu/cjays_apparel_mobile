import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/enums.dart';
import 'package:cjays/views/home/components/home_body.dart';
import 'package:cjays/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  HomeScreen({Key? key}) : super(key: key);
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
        body: Padding(
          padding: EdgeInsets.only(left: height * 0.0, right: 0),
          child: HomeBody(),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
