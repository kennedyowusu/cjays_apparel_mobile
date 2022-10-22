import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/enums.dart';
import 'package:cjays/views/new_arrival/components/new_arrival_body.dart';
import 'package:cjays/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class NewArrivalScreen extends StatelessWidget {
  const NewArrivalScreen({Key? key}) : super(key: key);

  static const routeName = '/new';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              "CJAYS APPAREL NEW".toUpperCase(),
              style: kTabBarItemFontStyle.copyWith(
                fontSize: 18.0 * kMultiplier * height,
                fontWeight: FontWeight.bold,
                color: ProjectColors.kBlackColor,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ProjectColors.kWhiteColor,
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.020),
          child: SingleChildScrollView(child: NewArrivalBody()),
        ),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.arrival),
      ),
    );
  }
}
