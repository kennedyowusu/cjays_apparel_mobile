import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/enums.dart';
import 'package:cjays/views/shop/components/shop_body.dart';
import 'package:cjays/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  static const routeName = '/shop';

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

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
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "All Dresses".toUpperCase(),
                  style: kTabBarItemFontStyle.copyWith(
                    fontSize: 18.0 * kMultiplier * height,
                    fontWeight: FontWeight.bold,
                    color: ProjectColors.kBlackColor,
                  ),
                ),
                Text(
                  "3456 Items",
                  style: kTabBarItemFontStyle.copyWith(
                    fontSize: 11.0 * kMultiplier * height,
                    color: ProjectColors.kBlackColor,
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ProjectColors.kWhiteColor,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite_border_sharp,
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
          padding: EdgeInsets.symmetric(
            horizontal: height * 0.02,
          ),
          child: ShopBody(),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.shop),
      ),
    );
  }
}
